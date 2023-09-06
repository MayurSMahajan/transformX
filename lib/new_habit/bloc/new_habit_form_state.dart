part of 'new_habit_form_bloc.dart';

class NewHabitFormState extends Equatable {
  const NewHabitFormState({
    this.status = FormzSubmissionStatus.initial,
    this.habitName = const HabitName.pure(),
    this.habitLocation = const HabitLocation.pure(),
    this.habitTime = const Time(hour: 0, mins: 0),
    this.habitMetricMin = const HabitMetricMin.pure(),
    this.habitMetricIdeal = const HabitMetricIdeal.pure(),
    this.habitRitual = const HabitRitual.pure(),
    this.habitShortReward = const HabitShortReward.pure(),
    this.habitLongReward = const HabitLongReward.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final HabitName habitName;
  final HabitLocation habitLocation;
  final Time habitTime;
  final HabitMetricMin habitMetricMin;
  final HabitMetricIdeal habitMetricIdeal;
  final HabitRitual habitRitual;
  final HabitShortReward habitShortReward;
  final HabitLongReward habitLongReward;
  final bool isValid;

  NewHabitFormState copyWith({
    FormzSubmissionStatus? status,
    HabitName? habitName,
    HabitLocation? habitLocation,
    Time? habitTime,
    HabitMetricMin? habitMetricMin,
    HabitMetricIdeal? habitMetricIdeal,
    HabitRitual? habitRitual,
    HabitShortReward? habitShortReward,
    HabitLongReward? habitLongReward,
    bool? isValid,
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
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [
        status,
        habitName,
        habitLocation,
        habitMetricMin,
        habitMetricIdeal,
        habitLongReward,
        habitShortReward,
        habitRitual,
        isValid,
      ];
}
