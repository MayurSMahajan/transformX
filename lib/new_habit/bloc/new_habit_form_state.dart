part of 'new_habit_form_bloc.dart';

enum NewHabitFormStatus {
  initial,
  progress,
  success,
  failure,
}

class NewHabitFormState extends Equatable {
  const NewHabitFormState({
    this.status = NewHabitFormStatus.initial,
    this.habitName = '',
    this.habitLocation = '',
    this.habitTime = const Time(hour: 0, mins: 0),
    this.habitMetricMin = 1,
    this.habitMetricIdeal = 10,
    this.habitRitual = '',
    this.habitShortReward = '',
    this.habitLongReward = '',
  });

  final NewHabitFormStatus status;
  final String habitName;
  final String habitLocation;
  final Time habitTime;
  final int habitMetricMin;
  final int habitMetricIdeal;
  final String habitRitual;
  final String habitShortReward;
  final String habitLongReward;

  NewHabitFormState copyWith({
    NewHabitFormStatus? status,
    String? habitName,
    String? habitLocation,
    Time? habitTime,
    int? habitMetricMin,
    int? habitMetricIdeal,
    String? habitRitual,
    String? habitShortReward,
    String? habitLongReward,
  }) {
    return NewHabitFormState(
      status: status ?? this.status,
      habitName: habitName ?? this.habitName,
      habitLocation: habitLocation ?? this.habitLocation,
      habitTime: habitTime ?? this.habitTime,
      habitMetricMin: habitMetricMin ?? this.habitMetricMin,
      habitMetricIdeal: habitMetricIdeal ?? this.habitMetricIdeal,
      habitRitual: habitRitual ?? this.habitRitual,
      habitShortReward: habitShortReward ?? this.habitShortReward,
      habitLongReward: habitLongReward ?? this.habitLongReward,
    );
  }

  @override
  List<Object> get props => [
        status,
        habitName,
        habitLocation,
        habitTime.hour,
        habitTime.mins,
        habitTime.isAm,
        habitMetricMin,
        habitMetricIdeal,
        habitLongReward,
        habitShortReward,
        habitRitual,
      ];
}
