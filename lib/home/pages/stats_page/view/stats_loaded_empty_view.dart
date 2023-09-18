import 'package:flutter/material.dart';
import 'package:transformx/home/pages/home_page/home_page.dart';
import 'package:transformx/l10n/l10n.dart';

class StatsLoadedEmptyView extends StatelessWidget {
  const StatsLoadedEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
            l10n.whyTrackHabit,
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
