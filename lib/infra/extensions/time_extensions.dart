import 'package:habits_api/habits_api.dart';

extension TimeFormat on Time {
  /// returns a `String` which contains `Time` in a readable format
  String toReadableString() {
    final amPmString = isAm ? 'am' : 'pm';
    return '$hour:$mins $amPmString';
  }
}
