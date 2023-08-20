import 'package:formz/formz.dart';

enum HabitLocationValidationError { empty, numeric }

class HabitLocation extends FormzInput<String, HabitLocationValidationError> {
  const HabitLocation.pure() : super.pure('');
  const HabitLocation.dirty([super.value = '']) : super.dirty();

  @override
  HabitLocationValidationError? validator(String value) {
    if (value.isEmpty) {
      return HabitLocationValidationError.empty;
    }
    if (value.contains(RegExp(r'^[0-9]+$'))) {
      return HabitLocationValidationError.numeric;
    }
    return null;
  }
}
