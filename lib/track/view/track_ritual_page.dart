import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:transformx/track/track.dart';

class TrackRitualPage extends StatelessWidget {
  const TrackRitualPage({required this.habit, super.key});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.go('/overview', extra: habit),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'Complete Your 1-min Ritual',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                habit.ritual,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 40),
              TimerWithActions(
                skipMethod: () => context.go('/progress', extra: habit),
                primaryMethod: () => context.go('/progress', extra: habit),
                maxSeconds: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
