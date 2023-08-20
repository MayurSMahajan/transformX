import 'package:formz/formz.dart';

enum HabitMetricValidationError { large, negative }

class HabitMetricMin extends FormzInput<int, HabitMetricValidationError> {
  const HabitMetricMin.pure() : super.pure(0);
  const HabitMetricMin.dirty([super.value = 0]) : super.dirty();

  @override
  HabitMetricValidationError? validator(int value) => _metricValidator(value);
}

class HabitMetricIdeal extends FormzInput<int, HabitMetricValidationError> {
  const HabitMetricIdeal.pure() : super.pure(0);
  const HabitMetricIdeal.dirty([super.value = 0]) : super.dirty();

  @override
  HabitMetricValidationError? validator(int value) => _metricValidator(value);
}

HabitMetricValidationError? _metricValidator(int value) {
  if (value > 999) {
    return HabitMetricValidationError.large;
  }
  if (value < 0) {
    return HabitMetricValidationError.negative;
  }
  return null;
}
