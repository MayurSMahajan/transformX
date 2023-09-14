// ignore_for_file: prefer_constructors_over_static_methods

import 'package:equatable/equatable.dart';
import 'package:habits_api/habits_api.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'habit.g.dart';

/// {@template habit_item}
/// A single `habit` item.
///
/// Contains a [title], [time], [metric], [location] and [id],
/// in addition to a [icon] which is URL for habit illustration.
///
/// If an [id] is provided, it cannot be empty. If no [id] is provided, one
/// will be generated.
///
/// [Habit]s are immutable and can be copied using [copyWith], in addition to
/// being serialized and deserialized using [toJson] and [fromJson]
/// respectively.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true)
class Habit extends Equatable {
  /// {@macro habit_item}
  Habit({
    required this.title,
    required this.location,
    required this.time,
    required this.metric,
    required this.ritual,
    required this.shortReward,
    required this.longReward,
    Stats? stats,
    String? id,
    this.icon,
  })  : assert(
          id == null || id.isNotEmpty,
          'id must either be null or not empty',
        ),
        id = id ?? const Uuid().v4(),
        stats = stats ?? const Stats();

  /// The unique identifier of the `habit`.
  ///
  /// Cannot be empty.
  final String id;

  /// The title of the `habit`.
  ///
  /// Note that the title may be empty.
  final String title;

  /// The location of the `habit`.
  ///
  /// Defaults to an empty string.
  final String location;

  /// The time of the `habit`.
  ///
  /// time when the user is expected to their habit.
  final Time time;

  /// The metric or some unit of measuring progress of the `habit`.
  ///
  /// can be empty
  final Metric metric;

  /// The Url for the icon of the `habit`.
  ///
  /// can be null
  final String? icon;

  /// The short preparation activity done before the `habit`.
  ///
  /// Can be empty but not null
  final String ritual;

  /// The daily reward for the `habit`.
  ///
  /// Can be empty but not null
  final String shortReward;

  /// The long-term reward for the `habit`.
  ///
  /// Can be empty but not null
  final String longReward;

  /// Contains the statistics of the `habit`
  ///
  /// can
  final Stats stats;

  /// Returns a copy of this `habit` with the given values updated.
  ///
  /// {@macro habit_item}
  Habit copyWith({
    String? id,
    String? title,
    String? location,
    Time? time,
    Metric? metric,
    String? icon,
    String? ritual,
    String? shortReward,
    String? longReward,
    Stats? stats,
  }) {
    return Habit(
      id: id ?? this.id,
      title: title ?? this.title,
      location: location ?? this.location,
      time: time ?? this.time,
      metric: metric ?? this.metric,
      icon: icon ?? this.icon,
      ritual: ritual ?? this.ritual,
      shortReward: shortReward ?? this.shortReward,
      longReward: longReward ?? this.longReward,
      stats: stats ?? this.stats,
    );
  }

  /// Deserializes the given [JsonMap] into a [Habit].
  static Habit fromJson(JsonMap json) => _$HabitFromJson(json);

  /// Converts this [Habit] into a [JsonMap].
  JsonMap toJson() => _$HabitToJson(this);

  @override
  List<Object> get props => [
        id,
        title,
        location,
        time.hour,
        time.mins,
        time.isAm,
        metric.title,
        metric.minimum,
        metric.ideal,
        ritual,
        shortReward,
        longReward,
      ];

  /// Returns a dummy or empty habit.
  static Habit get empty => Habit(
        title: '',
        location: '',
        time: const Time(hour: 0, mins: 0),
        metric: const Metric(),
        ritual: '',
        shortReward: '',
        longReward: '',
      );
}
