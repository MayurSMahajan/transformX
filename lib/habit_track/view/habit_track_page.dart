import 'package:flutter/material.dart';
import 'package:transformx/habit_track/habit_track.dart';
import 'package:transformx/infra/infra.dart';

class HabitTrackPage extends StatelessWidget {
  const HabitTrackPage({super.key});

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
        body: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HabitHorizontalCard(),
              HabitRecordContainer(),
              HabitMetricContainer(),
              HabitStackContainer(),
              VSpace(),
              HabitStackAction(),
            ],
          ),
        ),
      ),
    );
  }
}
