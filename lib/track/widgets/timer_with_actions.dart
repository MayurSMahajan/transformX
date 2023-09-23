import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:transformx/infra/infra.dart';

const startTimerLabel = 'Start Timer';
const pauseTimerLabel = 'Pause Timer';

class TimerWithActions extends StatefulWidget {
  const TimerWithActions({
    required this.skipPath,
    required this.maxSeconds,
    this.actionText = 'Submit Time',
    super.key,
  });

  final String skipPath;
  final int maxSeconds;
  final String actionText;

  @override
  State<TimerWithActions> createState() => _TimerWithActionsState();
}

class _TimerWithActionsState extends State<TimerWithActions>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String timerActionLabel = startTimerLabel;
  bool isTimerCompleted = false;

  @override
  void initState() {
    super.initState();
    final duration = Duration(seconds: widget.maxSeconds);
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: duration,
    );
    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          setState(() => isTimerCompleted = true);
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleTimer() {
    if (_controller.isAnimating) {
      _controller.stop();
      setState(() => timerActionLabel = startTimerLabel);
    } else {
      _controller.forward();
      setState(() => timerActionLabel = pauseTimerLabel);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: 56,
        );

    return Column(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final seconds = _controller.value * widget.maxSeconds;
            return CircularPercentIndicator(
              radius: 150,
              lineWidth: 30,
              percent: _controller.value,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${seconds ~/ 60}',
                        style: textStyle,
                      ),
                      SizedBox(
                        width: 20,
                        child: Center(child: Text('.', style: textStyle)),
                      ),
                      Text(
                        (seconds % 60).toStringAsFixed(0),
                        style: textStyle,
                      ),
                    ],
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
            );
          },
        ),
        const AspectRatio(aspectRatio: 1.8, child: SizedBox()),
        PrimaryButton(
          onPressed: toggleTimer,
          text: isTimerCompleted ? widget.actionText : timerActionLabel,
        ),
      ],
    );
  }
}
