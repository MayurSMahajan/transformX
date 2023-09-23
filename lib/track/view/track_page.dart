import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_repository/track_repository.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/track/bloc/track_bloc.dart';

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

  void submitTrack(BuildContext context) {
    context.read<TrackBloc>().add(SaveTrack(trackedUpdate: minutes));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  'drag the slider to specify minutes',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 4),
                Slider.adaptive(
                  thumbColor: Colors.orange,
                  activeColor: Colors.amber.shade300,
                  inactiveColor: Colors.amber.shade100,
                  max: idealTarget.toDouble(),
                  value: minutes.toDouble(),
                  onChanged: (value) {
                    setState(
                      () => minutes = value.toInt(),
                    );
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                onPressed: () => submitTrack(context),
                text: 'Submit Score',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
