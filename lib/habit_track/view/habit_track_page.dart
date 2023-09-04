import 'package:flutter/material.dart';
import 'package:habits_api/habits_api.dart';
import 'package:transformx/habit_track/habit_track.dart';
import 'package:transformx/infra/infra.dart';

class HabitTrackPage extends StatelessWidget {
  const HabitTrackPage({required this.habit, super.key});

  final Habit? habit;

  @override
  Widget build(BuildContext context) {
    return habit != null
        ? HabitLoadedView(
            habit: habit!,
          )
        : const HabitNotLoadedView();
  }
}

class HabitLoadedView extends StatelessWidget {
  const HabitLoadedView({required this.habit, super.key});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Edit'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HabitHorizontalCard(
                title: habit.title,
                location: habit.location,
                streak: habit.stats.streak,
              ),
              HabitRecordContainer(
                stats: habit.stats,
              ),
              HabitMetricContainer(
                metric: habit.metric,
              ),
              HabitStackContainer(
                title: habit.title,
              ),
              const VSpace(),
              const HabitStackAction(),
            ],
          ),
        ),
      ),
    );
  }
}

class HabitNotLoadedView extends StatelessWidget {
  const HabitNotLoadedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Some Problem Occured'),
      ),
    );
  }
}
