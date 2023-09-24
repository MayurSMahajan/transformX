import 'package:track_repository/track_repository.dart';

extension DateEquality on Track {
  bool isNotSameDate() {
    final today = DateTime.now();
    return dateTime.day != today.day ||
        dateTime.month != today.month ||
        dateTime.year != today.year;
  }

  bool shouldResetStreak() {
    final diff = DateTime.now().difference(dateTime);
    final ans = diff > const Duration(hours: 24);
    return ans;
  }
}
