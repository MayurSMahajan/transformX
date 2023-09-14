import 'package:fl_chart/fl_chart.dart';
import 'package:stats_repository/stats_repository.dart';

extension SpotsToFlSpots on List<Spot> {
  List<FlSpot> getFlSpots() {
    return map((spot) => FlSpot(spot.x + 1, spot.y)).toList();
  }
}
