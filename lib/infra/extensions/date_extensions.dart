import 'dart:developer';

import 'package:track_repository/track_repository.dart';

extension DateEquality on Track {
  bool isNotSameDate() {
    final dt = DateTime.now();
    return dateTime.day != dt.day ||
        dateTime.month != dt.month ||
        dateTime.year != dt.year;
  }

  bool shouldResetStreak() {
    final diff = DateTime.now().difference(dateTime);
    final ans = diff > const Duration(hours: 24);
    log('shouldResetStreak: $ans');
    return ans;
  }
}
