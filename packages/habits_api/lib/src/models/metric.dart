import 'package:freezed_annotation/freezed_annotation.dart';

part 'metric.freezed.dart';

part 'metric.g.dart';

/// Metric class represents a unit of measurement for progress in habit
@freezed
class Metric with _$Metric {
  /// the title field that defines the type of Metric, eg: minutes, litres, etc.
  /// the minimum field describes the minimum amount to satisfy a habit goal.
  /// the ideal field describes the ideal amount to satisfy a habit goal.
  const factory Metric({
    @Default('minutes') String title,
    @Default(5) int minimum,
    @Default(20) int ideal,
  }) = _Metric;

  ///utility method for creating Metric from JSON
  factory Metric.fromJson(Map<String, Object?> json) => _$MetricFromJson(json);
}
