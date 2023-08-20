import 'package:formz/formz.dart';

enum HabitNameValidationError { empty, numeric }

class HabitName extends FormzInput<String, HabitNameValidationError> {
  const HabitName.pure() : super.pure('');
  const HabitName.dirty([super.value = '']) : super.dirty();

  @override
  HabitNameValidationError? validator(String value) {
    if (value.isEmpty) {
      return HabitNameValidationError.empty;
    }
    if (value.contains(RegExp(r'^[0-9]+$'))) {
      return HabitNameValidationError.numeric;
    }
    return null;
  }
}
