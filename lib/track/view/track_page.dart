import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularPercentIndicator(
                radius: 150,
                lineWidth: 30,
                percent: minutes / idealTarget,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$minutes',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 52,
                          ),
                    ),
                    Text(
                      'minutes',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                backgroundColor: Colors.amber.shade100,
                progressColor: Colors.amber,
                circularStrokeCap: CircularStrokeCap.round,
              ),
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
        ),
      ),
    );
  }
}
