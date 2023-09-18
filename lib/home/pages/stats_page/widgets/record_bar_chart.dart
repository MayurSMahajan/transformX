import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RecordBarChart extends StatelessWidget {
  const RecordBarChart({
    required this.weekly,
    required this.monthly,
    required this.yearly,
    super.key,
  });

  final double weekly;
  final double monthly;
  final double yearly;

  @override
  Widget build(BuildContext context) {
    final weeklyPercent = weekly / 7;
    final monthlyPercent = monthly / 30;
    final yearlyPercent = yearly / 365;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(width: 0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: AspectRatio(
        aspectRatio: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LinearPercentIndicator(
              animation: true,
              lineHeight: 20,
              percent: weeklyPercent,
              center: Text('${weekly.toStringAsFixed(0)} days'),
              progressColor: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).canvasColor,
              barRadius: const Radius.circular(4),
            ),
            const Padding(
              padding: EdgeInsets.all(4),
              child: Text('Weekly'),
            ),
            const SizedBox(height: 5),
            LinearPercentIndicator(
              animation: true,
              lineHeight: 20,
              percent: monthlyPercent,
              center: Text('${monthly.toStringAsFixed(0)} days'),
              progressColor: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).canvasColor,
              barRadius: const Radius.circular(4),
            ),
            const Padding(
              padding: EdgeInsets.all(4),
              child: Text('Monthly'),
            ),
            const SizedBox(height: 5),
            LinearPercentIndicator(
              animation: true,
              lineHeight: 20,
              percent: yearlyPercent,
              center: Text('${yearly.toStringAsFixed(0)} days'),
              progressColor: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).canvasColor,
              barRadius: const Radius.circular(4),
            ),
            const Padding(
              padding: EdgeInsets.all(4),
              child: Text('Yearly'),
            ),
          ],
        ),
      ),
    );
  }
}
