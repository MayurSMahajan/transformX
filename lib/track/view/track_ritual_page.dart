import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:transformx/track/track.dart';

class TrackRitualPage extends StatelessWidget {
  const TrackRitualPage({required this.habit, super.key});

  final Habit habit;

  void ritualProgress(int num) {
    log('RitualProgress: $num');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () => context.push('/progress', extra: habit),
            child: const Text('Skip'),
          ),
        ],
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                habit.ritual,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              TimerWithActions(
                maxSeconds: 60,
                submitProgress: ritualProgress,
                isRitual: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
