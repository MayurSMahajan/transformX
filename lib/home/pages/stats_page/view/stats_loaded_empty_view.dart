import 'package:flutter/material.dart';
import 'package:transformx/home/pages/home_page/home_page.dart';

const whyTrackHabits =
    'Tracking your habit progress daily gives you the motivation to sustain them';

class StatsLoadedEmptyView extends StatelessWidget {
  const StatsLoadedEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Create a new habit to see its stats',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Text(
            whyTrackHabits,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          const NewHabitCardBtn(isPrimary: true),
        ],
      ),
    );
  }
}
