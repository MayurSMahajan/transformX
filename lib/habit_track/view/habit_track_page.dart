import 'package:flutter/material.dart';
import 'package:transformx/habit_track/habit_track.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/l10n/l10n.dart';

class HabitTrackPage extends StatelessWidget {
  const HabitTrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(l10n.editText),
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
