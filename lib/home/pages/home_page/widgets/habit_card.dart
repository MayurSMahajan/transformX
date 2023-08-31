import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transformx/infra/widgets/metadata_card.dart';

class HabitCard extends StatelessWidget {
  const HabitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/track'),
      child: Container(
        width: 170,
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
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Hero(
                    tag: 'habit_icon',
                    child: Icon(
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
                    'go to gym and gym',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              const MetadataCard(
                icon: Icon(Icons.timer_outlined),
                metadata: '06:00AM',
              ),
              const MetadataCard(
                icon: Icon(Icons.pin_drop_outlined),
                metadata: 'gym',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
