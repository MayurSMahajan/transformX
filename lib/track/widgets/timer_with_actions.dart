import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:transformx/infra/infra.dart';

const startTimerLabel = 'Start Timer';
const pauseTimerLabel = 'Pause Timer';

class TimerWithActions extends StatefulWidget {
  const TimerWithActions({
    required this.navigateMethod,
    required this.submitProgress,
    required this.maxSeconds,
    this.primaryLabel = 'Start Habit',
    this.secondaryLabel = 'Skip',
    this.isRitual = false,
    super.key,
  });

  final ValueSetter<int> submitProgress;
  final VoidCallback navigateMethod;
  final bool isRitual;
  final int maxSeconds;
  final String primaryLabel;
  final String secondaryLabel;

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
    if (isTimerCompleted) {
      submitProgress();
    } else {
      if (_controller.isAnimating) {
        _controller.stop();
        setState(() => timerActionLabel = startTimerLabel);
      } else {
        _controller.forward();
        setState(() => timerActionLabel = pauseTimerLabel);
      }
    }
  }

  void secondaryMethod() {
    submitProgress();
  }

  void submitProgress() {
    final mins = _controller.value * widget.maxSeconds ~/ 60;
    widget.submitProgress(mins);
    widget.navigateMethod();
  }

  @override
  Widget build(BuildContext context) {
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
              center: TimerText(
                maxSeconds: widget.maxSeconds,
                isRitual: widget.isRitual,
                seconds: seconds,
              ),
              backgroundColor: Colors.amber.shade100,
              progressColor: Colors.amber,
              circularStrokeCap: CircularStrokeCap.round,
            );
          },
        ),
        const AspectRatio(aspectRatio: 2, child: SizedBox()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SecondaryButton(
                label: widget.secondaryLabel,
                onPressed: secondaryMethod,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: PrimaryButton(
                onPressed: toggleTimer,
                text: isTimerCompleted ? widget.primaryLabel : timerActionLabel,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({
    required this.maxSeconds,
    required this.seconds,
    required this.isRitual,
    super.key,
  });

  final int maxSeconds;
  final double seconds;
  final bool isRitual;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: 56,
        );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isRitual)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (60 - (seconds % 60)).toStringAsFixed(0),
                style: textStyle,
              ),
            ],
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${(maxSeconds ~/ 60) - (seconds ~/ 60)}',
                style: textStyle,
              ),
              SizedBox(
                width: 20,
                child: Center(child: Text('.', style: textStyle)),
              ),
              Text(
                (60 - (seconds % 60)).toStringAsFixed(0),
                style: textStyle,
              ),
            ],
          ),
        Text(
          isRitual ? 'seconds' : 'minutes',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
