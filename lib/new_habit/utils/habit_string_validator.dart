class HabitStringValidator {
  static String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (value.contains(RegExp(r'^[0-9]+$'))) {
      return 'Should contain some alphabets';
    }
    if (value.length > 128) {
      return 'Try fewer characters than 128';
    }
    return null;
  }
}
