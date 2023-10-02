import 'package:flutter/material.dart';
import 'package:habits_api/habits_api.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/l10n/l10n.dart';
import 'package:transformx/overview/overview.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({required this.habit, super.key});

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
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(l10n.editText),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HabitHorizontalCard(
                id: habit.id,
                title: habit.title,
                location: habit.location,
                time: habit.time.toReadableString(),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 16,
                  bottom: 12,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MetadataCard(
                      icon: Icon(
                        Icons.scatter_plot_outlined,
                        color: Colors.grey,
                      ),
                      metadata: 'Habit Stats',
                    ),
                  ],
                ),
              ),
              HabitRecordContainer(
                record: habit.record,
                streak: habit.streak,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: Divider(color: Colors.grey.shade300),
              ),
              const SizedBox(height: 14),
              HabitMetricContainer(
                metric: habit.metric,
              ),
              const SizedBox(height: 18),
              HabitStackContainer(
                title: habit.title,
              ),
              AspectRatio(
                aspectRatio: 2,
                child: HabitStackAction(habit: habit),
              ),
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
