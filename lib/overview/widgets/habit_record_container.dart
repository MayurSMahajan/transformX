import 'package:flutter/material.dart';
import 'package:habits_api/habits_api.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/l10n/l10n.dart';

class HabitRecordContainer extends StatelessWidget {
  const HabitRecordContainer({
    required this.stats,
    super.key,
  });

  final Stats stats;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MetadataCard(
                icon: Image.asset(
                  'assets/icons/badge.png',
                  width: 22,
                  height: 22,
                ),
                metadata: 'Record',
              ),
              TextButton(
                child: Text(l10n.weekly),
                onPressed: () {},
              ),
            ],
          ),
          Stack(
            children: [
              CustomProgressIndicator(
                progress: (stats.weeklyRecord / 7) - 0.21,
                minHeight: 24,
              ),
              Positioned(
                left: 30,
                bottom: 1,
                child: Text(
                  '${stats.weeklyRecord} days',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
