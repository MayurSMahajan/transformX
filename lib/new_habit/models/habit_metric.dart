import 'package:formz/formz.dart';

enum HabitMetricMinValidationError { large, negative }

enum HabitMetricIdealValidationError { large, negative }

class HabitMetricMin extends FormzInput<int, HabitMetricMinValidationError> {
  const HabitMetricMin.pure() : super.pure(0);
  const HabitMetricMin.dirty([super.value = 0]) : super.dirty();

  @override
  HabitMetricMinValidationError? validator(int value) =>
      _metricValidator(value);
}

HabitMetricMinValidationError? _metricValidator(int value) {
  if (value > 999) {
    return HabitMetricMinValidationError.large;
  }
  if (value < 0) {
    return HabitMetricMinValidationError.negative;
  }
  return null;
}

class HabitMetricIdeal
    extends FormzInput<int, HabitMetricIdealValidationError> {
  const HabitMetricIdeal.pure() : super.pure(0);
  const HabitMetricIdeal.dirty([super.value = 0]) : super.dirty();

  @override
  HabitMetricIdealValidationError? validator(int value) =>
      _metricIdealValidator(value);
}

HabitMetricIdealValidationError? _metricIdealValidator(int value) {
  if (value > 999) {
    return HabitMetricIdealValidationError.large;
  }
  if (value < 0) {
    return HabitMetricIdealValidationError.negative;
  }
  return null;
}
