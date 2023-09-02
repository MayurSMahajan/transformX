import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats.freezed.dart';

part 'stats.g.dart';

/// Stats object
@freezed
class Stats with _$Stats {
  /// stats constructor
  const factory Stats({
    @Default(0) int streak,
    @Default(0) int monthlyRecord,
    @Default(0) int weeklyRecord,
    @Default(0) int yearlyRecord,
  }) = _Stats;

  ///utility method for creating Metric from JSON
  factory Stats.fromJson(Map<String, Object?> json) => _$StatsFromJson(json);
}
