import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:transformx/home/pages/stats_page/widgets/widgets.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 0.6,
            child: PageView(
              controller: _controller,
              children: [
                StatsContainer(
                  spots: spots,
                ),
                StatsContainer(
                  spots: spots,
                ),
                Container(
                  color: Colors.blueGrey,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  _controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                icon: const Icon(
                  Icons.chevron_left_rounded,
                  size: 38,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Habit Name',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                icon: const Icon(
                  Icons.chevron_right_rounded,
                  size: 38,
                ),
              ),
            ],
          )
        ],
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
