part of 'habits_bloc.dart';

enum AllHabitsStatus { initial, loading, success, failure }

final class HabitsState extends Equatable {
  const HabitsState({
    this.status = AllHabitsStatus.initial,
    this.habits = const [],
  });

  final AllHabitsStatus status;
  final Iterable<Habit> habits;

  HabitsState copyWith({
    AllHabitsStatus Function()? status,
    Iterable<Habit> Function()? habits,
  }) {
    return HabitsState(
      status: status != null ? status() : this.status,
      habits: habits != null ? habits() : this.habits,
    );
  }

  @override
  List<Object> get props => [status, habits];
}
