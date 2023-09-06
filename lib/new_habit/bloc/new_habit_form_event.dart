part of 'new_habit_form_bloc.dart';

sealed class NewHabitFormEvent extends Equatable {
  const NewHabitFormEvent();

  @override
  List<Object> get props => [];
}

final class HabitNameChanged extends NewHabitFormEvent {
  const HabitNameChanged(this.habitName);

  final String habitName;

  @override
  List<Object> get props => [habitName];
}

final class HabitLocationChanged extends NewHabitFormEvent {
  const HabitLocationChanged(this.habitLocation);

  final String habitLocation;

  @override
  List<Object> get props => [habitLocation];
}

final class HabitTimeChanged extends NewHabitFormEvent {
  const HabitTimeChanged(this.habitTime);

  final Time habitTime;

  @override
  List<Object> get props => [habitTime.hour, habitTime.mins, habitTime.isAm];
}

final class HabitMetricMinChanged extends NewHabitFormEvent {
  const HabitMetricMinChanged(this.habitMetricMin);

  final int habitMetricMin;

  @override
  List<Object> get props => [habitMetricMin];
}

final class HabitMetricIdealChanged extends NewHabitFormEvent {
  const HabitMetricIdealChanged(this.habitMetricIdeal);

  final int habitMetricIdeal;

  @override
  List<Object> get props => [habitMetricIdeal];
}

final class HabitRitualChanged extends NewHabitFormEvent {
  const HabitRitualChanged(this.habitRitual);

  final String habitRitual;

  @override
  List<Object> get props => [habitRitual];
}

final class HabitShortRewardChanged extends NewHabitFormEvent {
  const HabitShortRewardChanged(this.habitShortReward);

  final String habitShortReward;

  @override
  List<Object> get props => [habitShortReward];
}

final class HabitLongRewardChanged extends NewHabitFormEvent {
  const HabitLongRewardChanged(this.habitLongReward);

  final String habitLongReward;

  @override
  List<Object> get props => [habitLongReward];
}

final class HabitSubmitted extends NewHabitFormEvent {
  const HabitSubmitted();
}
