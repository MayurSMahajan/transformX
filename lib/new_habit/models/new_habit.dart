import 'package:equatable/equatable.dart';
import 'package:habits_api/habits_api.dart';

/// This model will be used for acquiring raw user data
/// and then convert this data to the Habit class in Habit API.
///
class NewHabit extends Equatable {
  const NewHabit({
    required this.title,
    required this.location,
    required this.time,
    required this.metricTitle,
    required this.metricMin,
    required this.metricIdeal,
    required this.ritual,
    required this.shortReward,
    required this.longReward,
    this.icon,
  }) : super();

  final String title;
  final String location;
  final DateTime time;
  final String metricTitle;
  final int metricMin;
  final int metricIdeal;
  final String? icon;
  final String ritual;
  final String shortReward;
  final String longReward;

  NewHabit copyWith({
    String? id,
    String? title,
    String? location,
    DateTime? time,
    String? metricTitle,
    int? metricMin,
    int? metricIdeal,
    String? icon,
    String? ritual,
    String? shortReward,
    String? longReward,
  }) {
    return NewHabit(
      title: title ?? this.title,
      location: location ?? this.location,
      time: time ?? this.time,
      metricTitle: metricTitle ?? this.metricTitle,
      metricMin: metricMin ?? this.metricMin,
      metricIdeal: metricIdeal ?? this.metricIdeal,
      icon: icon ?? this.icon,
      ritual: ritual ?? this.ritual,
      shortReward: shortReward ?? this.shortReward,
      longReward: longReward ?? this.longReward,
    );
  }

  //utility method that converts this raw data into the familiar habit class
  Habit toHabit() {
    const time = Time(hour: 12, mins: 44);
    final metric = Metric(
      title: metricTitle,
      minimum: metricMin,
      ideal: metricIdeal,
    );
    return Habit(
      title: title,
      location: location,
      time: time,
      metric: metric,
      ritual: ritual,
      shortReward: shortReward,
      longReward: longReward,
      icon: icon,
    );
  }

  @override
  List<Object> get props => [
        title,
        location,
        metricTitle,
        metricMin,
        metricIdeal,
        ritual,
        shortReward,
        longReward,
      ];
}
