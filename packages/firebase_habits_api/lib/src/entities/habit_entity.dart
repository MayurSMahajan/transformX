import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habits_api/habits_api.dart';

/// Our [HabitEntity] is the representation of our inside Firestore.
/// The fromSnapshot and toDocument are methods specific to Firestore.
///
class HabitEntity {
  /// constructor
  const HabitEntity({
    this.id,
    this.title,
    this.location,
    this.hour,
    this.mins,
    this.isAm,
    this.is24hour,
    this.metricTitle,
    this.metricMin,
    this.metricIdeal,
    this.ritual,
    this.shortReward,
    this.longReward,
    this.streak,
    this.record,
    this.icon,
  });

  /// factory constructor to create a [HabitEntity] from Firestore
  factory HabitEntity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return HabitEntity(
      id: data?['id'] as String,
      title: data?['title'] as String,
      location: data?['location'] as String,
      hour: data?['hour'] as int,
      mins: data?['mins'] as int,
      isAm: data?['isAm'] as bool,
      is24hour: data?['is24hour'] as bool,
      metricTitle: data?['metricTitle'] as String,
      metricMin: data?['metricMin'] as int,
      metricIdeal: data?['metricIdeal'] as int,
      ritual: data?['ritual'] as String,
      shortReward: data?['shortReward'] as String,
      longReward: data?['longReward'] as String,
      streak: data?['streak'] as int,
      record: data?['record'] as int,
      icon: data?['icon'] as String?,
    );
  }

  /// factory constructor to create a [HabitEntity] from [Habit]
  factory HabitEntity.fromHabit(
    Habit habit,
  ) {
    return HabitEntity(
      id: habit.id,
      title: habit.title,
      location: habit.location,
      hour: habit.time.hour,
      mins: habit.time.mins,
      isAm: habit.time.isAm,
      is24hour: habit.time.is24hour,
      metricTitle: habit.metric.title,
      metricMin: habit.metric.minimum,
      metricIdeal: habit.metric.ideal,
      ritual: habit.ritual,
      shortReward: habit.shortReward,
      longReward: habit.longReward,
      streak: habit.streak,
      record: habit.record,
      icon: habit.icon,
    );
  }

  ///the id of the habit
  final String? id;

  /// the title of the habit
  final String? title;

  /// the location of the habit
  final String? location;

  /// the hour, a subfield of Time object
  final int? hour;

  /// the mins, a subfield of Time object
  final int? mins;

  /// is Am format or PM format, a subfield of Time object
  final bool? isAm;

  /// is 24 hour format, a subfield of Time object
  final bool? is24hour;

  /// the means of measuring progress, a subfield of Metric object
  final String? metricTitle;

  /// the minsimum progress, a subfield of Metric object
  final int? metricMin;

  /// the ideal progress, a subfield of Metric object
  final int? metricIdeal;

  /// a ritual followed before a habit
  final String? ritual;

  /// short reward for habit
  final String? shortReward;

  /// long reward for habit
  final String? longReward;

  /// streak for the habit
  final int? streak;

  /// weeklyRecord for the habit
  final int? record;

  /// icon for habit for ux
  final String? icon;

  /// Method to convert [HabitEntity] to Map for storing in Firebase
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (location != null) 'location': location,
      if (hour != null) 'hour': hour,
      if (mins != null) 'mins': mins,
      if (isAm != null) 'isAm': isAm,
      if (is24hour != null) 'is24hour': is24hour,
      if (metricTitle != null) 'metricTitle': metricTitle,
      if (metricMin != null) 'metricMin': metricMin,
      if (metricIdeal != null) 'metricIdeal': metricIdeal,
      if (ritual != null) 'ritual': ritual,
      if (shortReward != null) 'shortReward': shortReward,
      if (longReward != null) 'longReward': longReward,
      if (streak != null) 'streak': streak,
      if (record != null) 'record': record,
      if (icon != null) 'icon': icon,
    };
  }

  /// Converts the [HabitEntity] object to a new [Habit] object
  /// assigns some default values to handle the null case
  Habit toHabit() {
    return Habit(
      id: id ?? '',
      title: title ?? '',
      location: location ?? '',
      time: Time(
        hour: hour ?? 0,
        mins: mins ?? 0,
        isAm: isAm ?? false,
      ),
      metric: Metric(
        title: metricTitle ?? '',
        minimum: metricMin ?? 0,
        ideal: metricIdeal ?? 0,
      ),
      ritual: ritual ?? '',
      shortReward: shortReward ?? '',
      longReward: longReward ?? '',
      streak: streak ?? 0,
      record: record ?? 0,
      icon: icon,
    );
  }
}
