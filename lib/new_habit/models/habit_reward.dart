import 'package:formz/formz.dart';

enum HabitRewardValidationError { empty, numeric, tooLong }

class HabitShortReward extends FormzInput<String, HabitRewardValidationError> {
  const HabitShortReward.pure() : super.pure('');
  const HabitShortReward.dirty([super.value = '']) : super.dirty();

  @override
  HabitRewardValidationError? validator(String value) => _validator(value);
}

class HabitLongReward extends FormzInput<String, HabitRewardValidationError> {
  const HabitLongReward.pure() : super.pure('');
  const HabitLongReward.dirty([super.value = '']) : super.dirty();

  @override
  HabitRewardValidationError? validator(String value) => _validator(value);
}

HabitRewardValidationError? _validator(String value) {
  if (value.isEmpty) {
    return HabitRewardValidationError.empty;
  }
  if (value.contains(RegExp(r'^[0-9]+$'))) {
    return HabitRewardValidationError.numeric;
  }
  if (value.length > 164) {
    return HabitRewardValidationError.tooLong;
  }
  return null;
}
