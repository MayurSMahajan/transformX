import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:transformx/home/pages/stats_page/widgets/widgets.dart';

class LineChartContainer extends StatelessWidget {
  const LineChartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "This Week's Performance",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        ProgressLineChart(spots: spots),
      ],
    );
  }
}

final List<FlSpot> spots = [
  const FlSpot(1, 3),
  const FlSpot(2, 4),
  const FlSpot(3, 5),
  const FlSpot(4, 2),
  const FlSpot(5, 4),
  const FlSpot(6, 5),
  const FlSpot(7, 6),
];
