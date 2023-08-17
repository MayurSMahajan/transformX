import 'package:equatable/equatable.dart';
import 'package:habits_api/habits_api.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'habit.g.dart';

/// {@template habit_item}
/// A single `habit` item.
///
/// Contains a [title], [hour], [mins], [location] and [id],
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
@JsonSerializable()
class Habit extends Equatable {
  /// {@macro habit_item}
  Habit({
    required this.title,
    required this.hour,
    required this.mins,
    required this.location,
    String? id,
    this.icon,
    this.isAm = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'id must either be null or not empty',
        ),
        id = id ?? const Uuid().v4();

  /// The unique identifier of the `habit`.
  ///
  /// Cannot be empty.
  final String id;

  /// The title of the `habit`.
  ///
  /// Note that the title may be empty.
  final String title;

  /// The time of the `habit`.
  ///
  /// In this field we only care about hours.
  final int hour;

  /// The time of the `habit`.
  ///
  /// In this field we only care about mins.
  final int mins;

  /// The time format of the `habit`.
  ///
  /// flag determining either am or pm.
  final bool isAm;

  /// The location of the `habit`.
  ///
  /// Defaults to an empty string.
  final String location;

  /// The icon of the `habit`.
  ///
  /// Url for the current user's icon
  final String? icon;

  /// Returns a copy of this `habit` with the given values updated.
  ///
  /// {@macro habit_item}
  Habit copyWith({
    String? id,
    String? title,
    int? hour,
    int? mins,
    String? location,
    String? icon,
    bool? isAm,
  }) {
    return Habit(
      id: id ?? this.id,
      title: title ?? this.title,
      hour: hour ?? this.hour,
      mins: mins ?? this.mins,
      location: location ?? this.location,
      isAm: isAm ?? this.isAm,
    );
  }

  /// Deserializes the given [JsonMap] into a [Habit].
  static Habit fromJson(JsonMap json) => _$HabitFromJson(json);

  /// Converts this [Habit] into a [JsonMap].
  JsonMap toJson() => _$HabitToJson(this);

  @override
  List<Object> get props => [id, title, hour, mins, location, isAm];
}
