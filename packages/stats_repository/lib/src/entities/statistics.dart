import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:habits_repository/habits_repository.dart';

/// A list of Track object
typedef Spots = List<FlSpot>;

/// This is a mixture of two entities that we store in our database.
/// This contains the Stats data from the Habit model
/// And also contains a List of FLSpot objects.
/// This FLSpot is a class from fl_chart used for a line chart
/// This entity is not sent to database, it is purely written
/// for facilitating the UI of the stats screen.
class Statistics extends Equatable {
  /// constructor for Statistics.
  const Statistics({
    required this.habitId,
    required this.habitName,
    required this.stats,
    this.spots = const [],
  });

  /// An unique String id representing an habit.
  final String habitId;

  /// The name of the habit.
  final String habitName;

  /// the stats of the habit i.e records.
  final Stats stats;

  /// the last 7 track objects
  final Spots spots;

  @override
  List<Object?> get props => [
        habitId,
        habitName,
        stats.weeklyRecord,
        stats.monthlyRecord,
        stats.yearlyRecord,
        stats.allTimeRecord,
        spots,
      ];
}
