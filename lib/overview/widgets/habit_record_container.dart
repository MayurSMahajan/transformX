import 'package:flutter/material.dart';

class HabitRecordContainer extends StatelessWidget {
  const HabitRecordContainer({
    required this.record,
    required this.streak,
    super.key,
  });

  final int record;
  final int streak;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: RecordCard(
            label: 'Streak',
            value: streak,
            iconData: Icons.local_fire_department,
          ),
        ),
        Container(
          height: 55,
          width: 1.25,
          color: Colors.grey.shade300,
        ),
        Expanded(
          child: RecordCard(
            label: 'Record',
            value: streak,
            iconData: Icons.military_tech,
          ),
        ),
      ],
    );
  }
}

class RecordCard extends StatelessWidget {
  const RecordCard({
    required this.label,
    required this.value,
    required this.iconData,
    super.key,
  });

  final String label;
  final int value;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 4),
        Icon(
          iconData,
          color: Colors.orangeAccent,
          size: 52,
        ),
        const SizedBox(height: 4),
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
