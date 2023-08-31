import 'package:flutter/material.dart';
import 'package:transformx/infra/widgets/vspace.dart';

class DailyStreakCard extends StatelessWidget {
  const DailyStreakCard({
    required this.day,
    this.isActive = false,
    super.key,
  });

  final String day;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const VSpace(),
        if (isActive)
          Image.asset(
            'assets/icons/streak_active.png',
            width: 28,
            height: 28,
          )
        else
          Image.asset(
            'assets/icons/streak_inactive.png',
            width: 28,
            height: 28,
          )
      ],
    );
  }
}
