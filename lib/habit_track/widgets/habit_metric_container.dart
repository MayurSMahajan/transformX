import 'package:flutter/material.dart';
import 'package:habits_api/habits_api.dart';

class HabitMetricContainer extends StatelessWidget {
  const HabitMetricContainer({required this.metric, super.key});

  final Metric metric;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HabitMetricCard(
            initialValue: metric.minimum,
            metricBound: 'Min',
          ),
          HabitMetricCard(
            initialValue: metric.ideal,
            metricBound: 'Ideal',
          ),
        ],
      ),
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
    setState(() => value = widget.initialValue);
  }

  void incrementValue() => setState(() => value++);
  void decrementValue() => setState(() => value--);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            widget.metricBound,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Container(
          width: 140,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: decrementValue,
                  icon: const Text('-'),
                ),
              ),
              Expanded(
                child: Text(
                  '$value',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: incrementValue,
                  icon: const Text('+'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
