import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:transformx/new_habit/models/models.dart';

part 'new_habit_form_event.dart';
part 'new_habit_form_state.dart';

class NewHabitFormBloc extends Bloc<NewHabitFormEvent, NewHabitFormState> {
  NewHabitFormBloc() : super(const NewHabitFormState()) {
    on<HabitNameChanged>(_onHabitNameChanged);
    on<HabitLocationChanged>(_onHabitLocationChanged);
    on<HabitMetricMinChanged>(_onHabitMetricMinChanged);
    on<HabitMetricIdealChanged>(_onHabitMetricIdealChanged);
    on<HabitRitualChanged>(_onHabitRitualChanged);
    on<HabitShortRewardChanged>(_onHabitShortRewardChangedd);
    on<HabitLongRewardChanged>(_onHabitLongRewardChanged);
    on<HabitSubmitted>(_onHabitSubmitted);
  }

  void _onHabitNameChanged(
    HabitNameChanged event,
    Emitter<NewHabitFormState> emit,
  ) {
    final habitName = HabitName.dirty(event.habitName);
    emit(
      state.copyWith(
        habitName: habitName,
        isValid: Formz.validate([
          habitName,
        ]),
      ),
    );
  }

  void _onHabitLocationChanged(
    HabitLocationChanged event,
    Emitter<NewHabitFormState> emit,
  ) {
    final habitLocation = HabitLocation.dirty(event.habitLocation);
    emit(
      state.copyWith(
        habitLocation: habitLocation,
        isValid: Formz.validate([
          state.habitName,
          habitLocation,
        ]),
      ),
    );
  }

  void _onHabitMetricMinChanged(
    HabitMetricMinChanged event,
    Emitter<NewHabitFormState> emit,
  ) {
    final habitMetricMin = HabitMetricMin.dirty(event.habitMetricMin);
    emit(
      state.copyWith(
        habitMetricMin: habitMetricMin,
        isValid: Formz.validate([
          habitMetricMin,
        ]),
      ),
    );
  }

  void _onHabitMetricIdealChanged(
    HabitMetricIdealChanged event,
    Emitter<NewHabitFormState> emit,
  ) {
    final habitMetricIdeal = HabitMetricIdeal.dirty(event.habitMetricIdeal);
    emit(
      state.copyWith(
        habitMetricIdeal: habitMetricIdeal,
        isValid: Formz.validate([
          state.habitMetricMin,
          habitMetricIdeal,
        ]),
      ),
    );
  }

  void _onHabitRitualChanged(
    HabitRitualChanged event,
    Emitter<NewHabitFormState> emit,
  ) {
    final habitRitual = HabitRitual.dirty(event.habitRitual);
    emit(
      state.copyWith(
        habitRitual: habitRitual,
        isValid: Formz.validate([
          habitRitual,
        ]),
      ),
    );
  }

  void _onHabitShortRewardChangedd(
    HabitShortRewardChanged event,
    Emitter<NewHabitFormState> emit,
  ) {
    final habitShortReward = HabitShortReward.dirty(event.habitShortReward);
    emit(
      state.copyWith(
        habitShortReward: habitShortReward,
        isValid: Formz.validate([
          state.habitName,
          state.habitLocation,
          state.habitLongReward,
          habitShortReward,
          state.habitMetricMin,
          state.habitMetricIdeal,
          state.habitRitual,
        ]),
      ),
    );
  }

  void _onHabitLongRewardChanged(
    HabitLongRewardChanged event,
    Emitter<NewHabitFormState> emit,
  ) {
    final habitLongReward = HabitLongReward.dirty(event.habitLongReward);
    emit(
      state.copyWith(
        habitLongReward: habitLongReward,
        isValid: Formz.validate([
          state.habitName,
          state.habitLocation,
          habitLongReward,
          state.habitShortReward,
          state.habitMetricMin,
          state.habitMetricIdeal,
          state.habitRitual,
        ]),
      ),
    );
  }

  Future<void> _onHabitSubmitted(
    HabitSubmitted event,
    Emitter<NewHabitFormState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        //call the habit repository to save this newly created habit
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
