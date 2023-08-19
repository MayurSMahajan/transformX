import 'package:freezed_annotation/freezed_annotation.dart';

part 'metric.freezed.dart';

part 'metric.g.dart';

/// Metric class represents a unit of measurement for progress in habit
@freezed
class Metric with _$Metric {
  /// hour and mins are required and isAM, is24hour
  /// are flags set to false by default
  const factory Metric({
    required String title,
    required int minimum,
    required int ideal,
  }) = _Metric;

  ///utility method for creating Metric from JSON
  factory Metric.fromJson(Map<String, Object?> json) => _$MetricFromJson(json);
}
