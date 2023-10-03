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
            value: metric.minimum,
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
            value: metric.ideal,
            metricBound: 'Ideal',
          ),
        ),
      ],
    );
  }
}

class HabitMetricCard extends StatelessWidget {
  const HabitMetricCard({
    required this.value,
    required this.metricBound,
    super.key,
  });

  final int value;
  final String metricBound;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            metricBound,
            style: Theme.of(context).textTheme.bodyLarge,
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
