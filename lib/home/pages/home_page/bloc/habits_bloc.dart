import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habits_repository/habits_repository.dart';

part 'habits_event.dart';
part 'habits_state.dart';

class HabitsBloc extends Bloc<HabitsEvent, HabitsState> {
  HabitsBloc({
    required HabitsRepository habitsRepository,
    required String userId,
  })  : _habitsRepository = habitsRepository,
        _userId = userId,
        super(const HabitsState()) {
    on<HabitsSubscriptionRequested>(_onSubscriptionRequested);
  }

  final String _userId;
  final HabitsRepository _habitsRepository;

  Future<void> _onSubscriptionRequested(
    HabitsSubscriptionRequested event,
    Emitter<HabitsState> emit,
  ) async {
    emit(state.copyWith(status: () => AllHabitsStatus.loading));

    await emit.forEach<Iterable<Habit>>(
      _habitsRepository.getHabits(_userId),
      onData: (habits) => state.copyWith(
        status: () => AllHabitsStatus.success,
        habits: () => habits,
      ),
      onError: (_, __) => state.copyWith(
        status: () => AllHabitsStatus.failure,
      ),
    );
  }
}
