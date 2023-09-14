import 'package:flutter/material.dart';
import 'package:stats_repository/stats_repository.dart';
import 'package:transformx/home/pages/stats_page/extensions/spots_to_flspots.dart';
import 'package:transformx/home/pages/stats_page/widgets/widgets.dart';

class StatsContainer extends StatelessWidget {
  const StatsContainer({
    required this.statistics,
    super.key,
  });

  final Statistics statistics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Last few performances',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 12),
        ProgressLineChart(spots: statistics.spots.getFlSpots()),
        const SizedBox(height: 12),
        Text(
          'Records',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 12),
        RecordBarChart(
          weekly: statistics.stats.weeklyRecord.toDouble(),
          monthly: statistics.stats.monthlyRecord.toDouble(),
          yearly: statistics.stats.yearlyRecord.toDouble(),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
