import 'package:formz/formz.dart';

enum HabitShortRewardValidationError { empty, numeric, tooLong }

enum HabitLongRewardValidationError { empty, numeric, tooLong }

class HabitShortReward
    extends FormzInput<String, HabitShortRewardValidationError> {
  const HabitShortReward.pure() : super.pure('');
  const HabitShortReward.dirty([super.value = '']) : super.dirty();

  @override
  HabitShortRewardValidationError? validator(String value) => _validator(value);
}

HabitShortRewardValidationError? _validator(String value) {
  if (value.isEmpty) {
    return HabitShortRewardValidationError.empty;
  }
  if (value.contains(RegExp(r'^[0-9]+$'))) {
    return HabitShortRewardValidationError.numeric;
  }
  if (value.length > 164) {
    return HabitShortRewardValidationError.tooLong;
  }
  return null;
}

class HabitLongReward
    extends FormzInput<String, HabitLongRewardValidationError> {
  const HabitLongReward.pure() : super.pure('');
  const HabitLongReward.dirty([super.value = '']) : super.dirty();

  @override
  HabitLongRewardValidationError? validator(String value) =>
      _validatorForLong(value);
}

HabitLongRewardValidationError? _validatorForLong(String value) {
  if (value.isEmpty) {
    return HabitLongRewardValidationError.empty;
  }
  if (value.contains(RegExp(r'^[0-9]+$'))) {
    return HabitLongRewardValidationError.numeric;
  }
  if (value.length > 164) {
    return HabitLongRewardValidationError.tooLong;
  }
  return null;
}
