import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_api/habits_api.dart';
import 'package:transformx/infra/infra.dart';

class HabitCard extends StatelessWidget {
  const HabitCard({required this.habit, super.key});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: () => context.go('/overview', extra: habit),
        child: Container(
          width: 165,
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).canvasColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Hero(
                      tag: habit.id,
                      child: const Icon(
                        Icons.sports_gymnastics,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      habit.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                MetadataCard(
                  icon: const Icon(
                    Icons.timer_outlined,
                    color: Colors.grey,
                  ),
                  metadata: habit.time.toReadableString(),
                ),
                MetadataCard(
                  icon: const Icon(
                    Icons.pin_drop_outlined,
                    color: Colors.grey,
                  ),
                  metadata: habit.location,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
