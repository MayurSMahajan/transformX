import 'package:habits_api/habits_api.dart';

extension TimeFormat on Time {
  /// returns a `String` which contains `Time` in a readable format
  String toReadableString() {
    final amPmString = isAm ? 'am' : 'pm';
    final hourString = hour < 10 ? '0$hour' : '$hour';
    final minsString = mins < 10 ? '0$mins' : '$mins';
    return '$hourString:$minsString $amPmString';
  }
}
