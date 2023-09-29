import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_api/habits_api.dart';
import 'package:transformx/infra/infra.dart';

class HabitStackAction extends StatelessWidget {
  const HabitStackAction({required this.habit, super.key});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrimaryButton(
          onPressed: () => context.push('/ritual', extra: habit),
          text: 'Start Tracking',
        ),
      ],
    );
  }
}
