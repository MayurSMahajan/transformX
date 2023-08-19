import 'package:freezed_annotation/freezed_annotation.dart';

part 'time.freezed.dart';

part 'time.g.dart';

/// Time class represents the time of the day when user starts their habit
@freezed
class Time with _$Time {
  /// hour and mins are required and isAM, is24hour
  /// are flags set to false by default
  const factory Time({
    required int hour,
    required int mins,
    @Default(false) bool isAm,
    @Default(false) bool is24hour,
  }) = _Time;

  ///utility method for creating Time from JSON
  factory Time.fromJson(Map<String, Object?> json) => _$TimeFromJson(json);
}
