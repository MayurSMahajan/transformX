import 'package:habits_api/habits_api.dart';

/// {@template habits_api}
/// The interface and models for an API providing access to habits.
/// {@endtemplate}
abstract class HabitsApi {
  /// {@macro habits_api}
  const HabitsApi();

  /// Provides a [Stream] of all habits.
  Stream<List<Habit>> getTodos();

  /// Saves a [habit].
  ///
  /// If a [habit] with the same id already exists, it will be replaced.
  Future<void> saveTodo(Habit habit);

  /// Deletes the `habit` with the given id.
  ///
  /// If no `habit` with the given id exists, a [HabitNotFoundException] error
  /// is thrown.
  Future<void> deleteTodo(String id);
}

/// Error thrown when a [Habit] with a given id is not found.
class HabitNotFoundException implements Exception {}
