part of 'new_habit_form_bloc.dart';

class NewHabitFormState extends Equatable {
  const NewHabitFormState({
    this.status = FormzSubmissionStatus.initial,
    this.habitName = '',
    this.habitLocation = '',
    this.habitTime = const Time(hour: 0, mins: 0),
    this.habitMetricMin = 1,
    this.habitMetricIdeal = 10,
    this.habitRitual = const HabitRitual.pure(),
    this.habitShortReward = const HabitShortReward.pure(),
    this.habitLongReward = const HabitLongReward.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final String habitName;
  final String habitLocation;
  final Time habitTime;
  final int habitMetricMin;
  final int habitMetricIdeal;
  final HabitRitual habitRitual;
  final HabitShortReward habitShortReward;
  final HabitLongReward habitLongReward;
  final bool isValid;

  NewHabitFormState copyWith({
    FormzSubmissionStatus? status,
    String? habitName,
    String? habitLocation,
    Time? habitTime,
    int? habitMetricMin,
    int? habitMetricIdeal,
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
        habitTime.hour,
        habitTime.mins,
        habitTime.isAm,
        habitMetricMin,
        habitMetricIdeal,
        habitLongReward,
        habitShortReward,
        habitRitual,
        isValid,
      ];
}
