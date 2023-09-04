import 'package:flutter/material.dart';
import 'package:transformx/infra/infra.dart';

class HabitHorizontalCard extends StatelessWidget {
  const HabitHorizontalCard({
    required this.title,
    required this.location,
    required this.streak,
    super.key,
  });

  final String title;
  final String location;
  final int streak;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).canvasColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Hero(
                        tag: 'habit_icon',
                        child: Icon(
                          Icons.sports_gymnastics,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const SizedBox(width: 38),
                Expanded(
                  child: Column(
                    children: [
                      const MetadataCard(
                        icon: Icon(Icons.timer_outlined),
                        metadata: '06:00AM',
                      ),
                      MetadataCard(
                        icon: const Icon(Icons.pin_drop_outlined),
                        metadata: location,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 60,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/streak_active.png',
                        width: 36,
                        height: 36,
                      ),
                      Text(
                        streak.toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
