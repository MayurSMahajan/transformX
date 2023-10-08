import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzd;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initializeNotifications() async {
    await _configureLocalTimeZone();
    const androidSettings = AndroidInitializationSettings('logo');

    const initializationSettings = InitializationSettings(
      android: androidSettings,
    );

    await _plugin.initialize(initializationSettings);
  }

  Future<void> sendNotification(String title, String body) async {
    const androidDetails = AndroidNotificationDetails('main', 'transformx');
    const notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await _plugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  tz.TZDateTime _scheduleDaily(int hour, int minutes) {
    // remind the user one hour ago.
    final remindHour = hour == 0 ? 23 : hour - 1;

    final now = tz.TZDateTime.now(tz.local);
    var scheduleDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      remindHour,
      minutes,
    );
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }

  Future<void> scheduleNotification(
    String title,
    String body,
    int hour,
    int minutes,
  ) async {
    try {
      const androidDetails = AndroidNotificationDetails('main', 'transformx');
      const notificationDetails = NotificationDetails(
        android: androidDetails,
      );

      final tzDateTime = _scheduleDaily(hour, minutes);

      await _plugin.zonedSchedule(
        0,
        title,
        body,
        tzDateTime,
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );

      final logMsg = '''
        Notification scheduled successfully: title: $title body: $body, 
        at hour: $hour, mins: $minutes
      ''';

      log(logMsg);
    } catch (e) {
      log('Something went wrong', error: e);
    }
  }

  Future<void> _configureLocalTimeZone() async {
    tzd.initializeTimeZones();
  }

  void cancelAll() => _plugin.cancelAll();
  void cancel(int id) => _plugin.cancel(id);
}
