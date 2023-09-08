import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:transformx/track/widgets/track_action.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  final minTarget = 30;
  final idealTarget = 60;

  int minutes = 01;

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
              const HabitTrackAction(),
            ],
          ),
        ),
      ),
    );
  }
}
