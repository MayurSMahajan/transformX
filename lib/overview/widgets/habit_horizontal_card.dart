import 'package:flutter/material.dart';
import 'package:transformx/infra/infra.dart';

class HabitHorizontalCard extends StatelessWidget {
  const HabitHorizontalCard({
    required this.id,
    required this.title,
    required this.location,
    required this.time,
    super.key,
  });

  final String id;
  final String title;
  final String location;
  final String time;

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
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Hero(
                        tag: id,
                        child: const Icon(
                          Icons.sports_gymnastics,
                          size: 32,
                          color: Colors.black,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MetadataCard(
                  icon: const Icon(
                    Icons.timer_outlined,
                    color: Colors.grey,
                  ),
                  metadata: time,
                ),
                MetadataCard(
                  icon: const Icon(
                    Icons.pin_drop_outlined,
                    color: Colors.grey,
                  ),
                  metadata: location,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
