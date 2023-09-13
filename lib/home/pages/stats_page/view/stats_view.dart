import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:transformx/home/pages/stats_page/widgets/widgets.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
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
        ),
      ),
    );
  }
}

final List<FlSpot> spots = [
  const FlSpot(1, 3.1),
  const FlSpot(2, 4.5),
  const FlSpot(3, 5.3),
  const FlSpot(4, 2.7),
  const FlSpot(5, 4.3),
  const FlSpot(6, 5),
  const FlSpot(7, 6),
];
