import 'package:flutter/material.dart';
import 'package:transformx/home/pages/home_page/widgets/widgets.dart';

class DailyStreakContainer extends StatelessWidget {
  const DailyStreakContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).canvasColor,
      ),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DailyStreakCard(day: 'Mo', isActive: true),
            DailyStreakCard(day: 'Tu', isActive: true),
            DailyStreakCard(day: 'We'),
            DailyStreakCard(day: 'Th', isActive: true),
            DailyStreakCard(day: 'Fr', isActive: true),
            DailyStreakCard(day: 'Sa', isActive: true),
            DailyStreakCard(day: 'Su'),
          ],
        ),
      ),
    );
  }
}
