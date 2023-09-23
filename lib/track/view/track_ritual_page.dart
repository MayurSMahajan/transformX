import 'package:flutter/material.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:transformx/track/track.dart';

class TrackRitualPage extends StatelessWidget {
  const TrackRitualPage({required this.habit, super.key});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Complete Your 1-min Ritual',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Text(
                habit.ritual,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 40),
              const TimerWithActions(skipPath: '/track', maxSeconds: 1 * 60),
            ],
          ),
        ),
      ),
    );
  }
}
