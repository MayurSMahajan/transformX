import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:transformx/home/pages/stats_page/widgets/widgets.dart';

class StatsContainer extends StatelessWidget {
  const StatsContainer({required this.spots, super.key});

  final List<FlSpot> spots;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "This Week's Performance",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 12),
        ProgressLineChart(spots: spots),
        const SizedBox(height: 12),
        Text(
          'Records',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 12),
        const RecordBarChart(
          weekly: 7,
          monthly: 29,
          yearly: 231,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
