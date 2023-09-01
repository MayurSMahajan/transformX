import 'package:habits_api/habits_api.dart';

/// {@template habits_repository}
/// A repository that handles `Habit` related requests.
/// {@endtemplate}
class HabitsRepository {
  /// {@macro habits_repository}
  const HabitsRepository({
    required HabitsApi habitsApi,
  }) : _habitsApi = habitsApi;

  final HabitsApi _habitsApi;

  /// Provides a [Stream] of all habits.
  Stream<Iterable<Habit>> getHabits(String userId) =>
      _habitsApi.getHabits(userId);

  /// Saves a [Habit].
  ///
  /// If a [Habit] with the same id already exists, it will be replaced.
  Future<void> saveHabit(Habit habit, String userId) =>
      _habitsApi.saveHabit(habit, userId);

  /// Deletes the `Habit` with the given id.
  ///
  /// If no `Habit` with the given id exists, a [HabitNotFoundException]
  ///  error is thrown.
  Future<void> deleteHabit(String id, String userId) =>
      _habitsApi.deleteHabit(id, userId);
}
