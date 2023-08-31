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
  Stream<List<Habit>> getHabits() => _habitsApi.getHabits();

  /// Saves a [Habit].
  ///
  /// If a [Habit] with the same id already exists, it will be replaced.
  Future<void> saveHabit(Habit habit) => _habitsApi.saveHabit(habit);

  /// Deletes the `Habit` with the given id.
  ///
  /// If no `Habit` with the given id exists, a [HabitNotFoundException] error is
  /// thrown.
  Future<void> deleteHabit(String id) => _habitsApi.deleteHabit(id);
}
