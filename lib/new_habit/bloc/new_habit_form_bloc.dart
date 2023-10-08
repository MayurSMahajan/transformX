import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits_repository/habits_repository.dart';

part 'new_habit_form_event.dart';
part 'new_habit_form_state.dart';

class NewHabitFormBloc extends Bloc<NewHabitFormEvent, NewHabitFormState> {
  NewHabitFormBloc({
    required HabitsRepository habitsRepository,
    required String userId,
  })  : _habitsRepository = habitsRepository,
        _userId = userId,
        super(const NewHabitFormState()) {
    on<HabitNameChanged>(_onHabitNameChanged);
    on<HabitLocationChanged>(_onHabitLocationChanged);
    on<HabitTimeChanged>(_onHabitTimeChanged);
    on<HabitMetricMinChanged>(_onHabitMetricMinChanged);
    on<HabitMetricIdealChanged>(_onHabitMetricIdealChanged);
    on<HabitRitualChanged>(_onHabitRitualChanged);
    on<HabitShortRewardChanged>(_onHabitShortRewardChangedd);
    on<HabitLongRewardChanged>(_onHabitLongRewardChanged);
    on<HabitSubmitted>(_onHabitSubmitted);
  }

  final HabitsRepository _habitsRepository;
  final String _userId;

  (String, String, int, int) getNotificationDetails() {
    final title = 'Time to ${state.habitName}';
    const body = 'Extend your habit streak, take a step today';
    var hour = state.habitTime.hour;
    final mins = state.habitTime.mins;
    if (!state.habitTime.isAm) {
      hour += 12;
    }
    return (title, body, hour, mins);
  }

  void _onHabitNameChanged(
    HabitNameChanged event,
    Emitter<NewHabitFormState> emit,
  ) {
    emit(
      state.copyWith(
        habitName: event.habitName,
      ),
    );
  }

  void _onHabitLocationChanged(
    HabitLocationChanged event,
    Emitter<NewHabitFormState> emit,
  ) {
    emit(
      state.copyWith(
        habitLocation: event.habitLocation,
      ),
    );
  }

  void _onHabitTimeChanged(
    HabitTimeChanged event,
    Emitter<NewHabitFormState> emit,
  ) {
    final habitTime = Time(
      hour: event.hour,
      mins: event.mins,
      isAm: event.isAm,
    );

    emit(
      state.copyWith(
        habitTime: habitTime,
      ),
    );
  }

  void _onHabitMetricMinChanged(
    HabitMetricMinChanged event,
    Emitter<NewHabitFormState> emit,
  ) {
    emit(
      state.copyWith(
        habitMetricMin: event.habitMetricMin,
      ),
    );
  }

  void _onHabitMetricIdealChanged(
    HabitMetricIdealChanged event,
    Emitter<NewHabitFormState> emit,
  ) {
    emit(
      state.copyWith(
        habitMetricIdeal: event.habitMetricIdeal,
      ),
    );
  }

  void _onHabitRitualChanged(
    HabitRitualChanged event,
    Emitter<NewHabitFormState> emit,
  ) {
    emit(
      state.copyWith(
        habitRitual: event.habitRitual,
      ),
    );
  }

  void _onHabitShortRewardChangedd(
    HabitShortRewardChanged event,
    Emitter<NewHabitFormState> emit,
  ) {
    emit(
      state.copyWith(
        habitShortReward: event.habitShortReward,
      ),
    );
  }

  void _onHabitLongRewardChanged(
    HabitLongRewardChanged event,
    Emitter<NewHabitFormState> emit,
  ) {
    emit(
      state.copyWith(
        habitLongReward: event.habitLongReward,
      ),
    );
  }

  Future<void> _onHabitSubmitted(
    HabitSubmitted event,
    Emitter<NewHabitFormState> emit,
  ) async {
    emit(state.copyWith(status: NewHabitFormStatus.progress));
    try {
      final finalHabit = Habit(
        title: state.habitName,
        location: state.habitLocation,
        time: state.habitTime,
        metric: Metric(
          minimum: state.habitMetricMin,
          ideal: state.habitMetricIdeal,
        ),
        ritual: state.habitRitual,
        shortReward: state.habitShortReward,
        longReward: state.habitLongReward,
        icon: 'assets/gym',
      );
      log('\n\n $finalHabit \n\n');
      await _habitsRepository.saveHabit(finalHabit, _userId);

      emit(state.copyWith(status: NewHabitFormStatus.success));
    } catch (_) {
      emit(state.copyWith(status: NewHabitFormStatus.failure));
    }
  }
}
