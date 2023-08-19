part of 'new_habit_cubit.dart';

enum NewHabitStatus {
  initial,
  quarter,
  half,
  quarterAndHalf,
  complete,
  created
}

@immutable
class NewHabitState extends Equatable {
  const NewHabitState({
    this.status = NewHabitStatus.initial,
  });

  final NewHabitStatus status;

  @override
  List<Object> get props => [status];
}
