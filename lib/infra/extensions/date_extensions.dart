extension DateEquality on DateTime {
  bool isNotSameDate() {
    final dt = DateTime.now();
    return day != dt.day || month != dt.month || year != dt.year;
  }

  bool shouldResetStreak() {
    final diff = DateTime.now().difference(this);
    return diff > const Duration(hours: 24);
  }
}
