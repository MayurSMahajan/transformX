import 'package:habit_stats_api/src/models/models.dart';

/// {@template habit_stats_api}
/// The interface for an API providing access to habit stats
/// {@endtemplate}
abstract class HabitStatsApi {
  /// {@macro habit_stats_api}
  const HabitStatsApi();

  /// Provides a Future of [Stats] of all todos.
  Future<Stats> getStats(String id);

  /// Saves a [stats].
  ///
  /// If a [stats] with the same id already exists, it will be replaced.
  Future<void> saveStats(Stats stats);

  /// Deletes the `stats` with the given id.
  ///
  /// If no `stats` with the given id exists, a [StatsNotFoundException] error is
  /// thrown.
  Future<void> deleteTodo(String id);
}

/// Error thrown when a [Stats] with a given id is not found.
class StatsNotFoundException implements Exception {}
