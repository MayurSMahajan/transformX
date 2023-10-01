import 'package:flutter/material.dart';
import 'package:habits_api/habits_api.dart';

class HabitMetricContainer extends StatelessWidget {
  const HabitMetricContainer({required this.metric, super.key});

  final Metric metric;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 2,
          child: HabitMetricCard(
            initialValue: metric.minimum,
            metricBound: 'Minimum',
          ),
        ),
        Container(
          height: 55,
          width: 1.25,
          color: Colors.grey.shade300,
        ),
        Expanded(
          flex: 2,
          child: HabitMetricCard(
            initialValue: metric.ideal,
            metricBound: 'Ideal',
          ),
        ),
      ],
    );
  }
}

class HabitMetricCard extends StatefulWidget {
  const HabitMetricCard({
    required this.initialValue,
    required this.metricBound,
    super.key,
  });

  final int initialValue;
  final String metricBound;

  @override
  State<HabitMetricCard> createState() => _HabitMetricCardState();
}

class _HabitMetricCardState extends State<HabitMetricCard> {
  int value = 0;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            widget.metricBound,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Text(
          '$value',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
