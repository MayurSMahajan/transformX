import 'package:formz/formz.dart';

enum HabitRitualValidationError { empty, numeric, tooLong }

class HabitRitual extends FormzInput<String, HabitRitualValidationError> {
  const HabitRitual.pure() : super.pure('');
  const HabitRitual.dirty([super.value = '']) : super.dirty();

  @override
  HabitRitualValidationError? validator(String value) {
    if (value.isEmpty) {
      return HabitRitualValidationError.empty;
    }
    if (value.contains(RegExp(r'^[0-9]+$'))) {
      return HabitRitualValidationError.numeric;
    }
    if (value.length > 164) {
      return HabitRitualValidationError.tooLong;
    }
    return null;
  }
}
