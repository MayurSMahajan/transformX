import 'package:fl_chart/fl_chart.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:stats_repository/src/entities/statistics.dart';
import 'package:track_repository/track_repository.dart';

/// {@template stats_repository}
/// A stats repository which facilitates the creation of stats for stats view
/// {@endtemplate}
class StatsRepository {
  /// {@macro stats_repository}
  const StatsRepository({
    required HabitsRepository habitsRepository,
    required TrackRepository trackRepository,
  })  : _habitsRepository = habitsRepository,
        _trackRepository = trackRepository;

  final HabitsRepository _habitsRepository;
  final TrackRepository _trackRepository;

  /// Returns an appropriate Statistics object for habitid
  Future<Statistics?> getStatistics({
    required String userId,
    required String habitId,
  }) async {
    final dummyHabit = Habit.empty;

    // fetch the habit stats and name from habitId
    final habits = _habitsRepository.getHabits(userId);
    final habit = await habits.expand((i) => i).firstWhere(
          (habit) => habit.id == habitId,
          orElse: () => dummyHabit,
        );

    // end if the habit id does not exist.
    if (habit == dummyHabit) {
      return null;
    }

    // fetch the last 7 tracks for the habitId.
    final tracks = await _trackRepository
        .getWeeklyTrack(
          habitId: habitId,
          userId: userId,
        )
        .first;

    // create spots for the last 7 tracks.
    final spots = <FlSpot>[];
    var xIndex = 0;
    for (var i = tracks.length - 1; i > -1; i--) {
      final spot = FlSpot(
        xIndex.toDouble(),
        tracks.elementAt(i).trackedUpdate / 10,
      );
      xIndex++;
      spots.add(spot);
    }

    return Statistics(
        habitId: habitId,
        habitName: habit.title,
        stats: habit.stats,
        spots: spots);
  }

  /// Returns a bool list which represents the streak in weekdays.
  /// Eg: if this method returns [t, f, t, f, t, t, t]
  /// then that means the habit was performed on mo, we, fr, sa, su.
  /// and the habit was missed on tues and thur
  Future<List<bool>> getStreakAllHabits({
    required String userId,
  }) async {
    // fetch the habit stats and name from habitId
    final habits = await _habitsRepository.getHabits(userId).first;
    final combinedStreak = List.filled(7, false);

    for (final h in habits) {
      final singleStreak = await getStreakSingleHabit(
        userId: userId,
        habitId: h.id,
      );
      combinedStreak.logicalOR(singleStreak);
    }
    return combinedStreak;
  }

  /// gets the habit streak for the individual habit.
  Future<List<bool>> getStreakSingleHabit({
    required String userId,
    required String habitId,
  }) async {
    // fetch the last 7 tracks for the habitId.
    final tracks = await _trackRepository
        .getWeeklyTrack(habitId: habitId, userId: userId)
        .first;

    final streak = List.filled(7, false);
    var trackIndex = 0;
    final today = DateTime.now();

    //handle te edge case that these weekdays are from different weeks
    //if the difference between today's date and last tracked date
    if (today.difference(tracks.first.dateTime).inDays > 7) {
      return streak;
    }

    for (var i = today.weekday; i > 0; i--) {
      final top = tracks.elementAt(trackIndex);
      if (top.dateTime.weekday == i) {
        streak[i - 1] = true;
        trackIndex++;
      }
    }

    return streak;
  }
}

extension on List<bool> {
  List<bool> logicalOR(List<bool> list2) {
    for (var i = 0; i < 7; i++) {
      this[i] = this[i] | list2[i];
    }
    return this;
  }
}
