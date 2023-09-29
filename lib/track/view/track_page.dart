import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:track_repository/track_repository.dart';
import 'package:transformx/track/track.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({required this.habit, this.track, super.key});

  final Track? track;
  final Habit habit;

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  final minTarget = 30;
  int ideal = 60;
  int minutes = 01;

  @override
  void initState() {
    super.initState();
    setState(() {
      minutes = widget.track?.trackedUpdate ?? 02;
      ideal = widget.habit.metric.ideal + 2;
      if (ideal <= minutes) {
        ideal += 5;
      }
    });
  }

  void _show(BuildContext ctx) {
    showModalBottomSheet<BottomSheet>(
      elevation: 10,
      context: ctx,
      builder: (ctx) => SkipTimerPopup(
        minutes: widget.track?.trackedUpdate ?? 01,
        ideal: ideal,
        submitProgress: submitTrackBySkip,
      ),
    );
  }

  void submitTrackBySkip(int submittedMins) {
    submitTrack(submittedMins);
    Navigator.of(context).pop();
  }

  void submitTrack(int submittedMins) {
    log('Submitted Progress: $submittedMins');
    context.read<TrackBloc>().add(SaveTrack(trackedUpdate: submittedMins));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'Track your habit progress',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => _show(context),
                    child: const Text('Skip and Submit'),
                  ),
                ],
              ),
              const SizedBox(height: 62),
              TimerWithActions(
                maxSeconds: widget.habit.metric.ideal * 60,
                primaryLabel: 'Submit Progress',
                secondaryLabel: 'Submit',
                submitProgress: submitTrack,
                navigateMethod: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
