import 'package:flutter/material.dart';
import 'package:track_repository/track_repository.dart';
import 'package:transformx/track/track.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({this.track, super.key});

  final Track? track;

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  final minTarget = 30;
  final idealTarget = 60;

  int minutes = 01;

  @override
  void initState() {
    super.initState();
    setState(() {
      minutes = widget.track?.trackedUpdate ?? 02;
    });
  }

  void _show(BuildContext ctx) {
    showModalBottomSheet<BottomSheet>(
      elevation: 10,
      context: ctx,
      builder: (ctx) => SkipTimerPopup(
        minutes: widget.track?.trackedUpdate ?? 02,
        ideal: 60,
        submitProgress: submitTrack,
      ),
    );
  }

  void submitTrack(int submittedMins) {
    print('Submitted mins: $submittedMins');
    // context.read<TrackBloc>().add(SaveTrack(trackedUpdate: submittedMins));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        ],
      ),
    );
  }
}
