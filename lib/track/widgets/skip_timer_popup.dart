import 'package:flutter/material.dart';
import 'package:transformx/infra/infra.dart';

class SkipTimerPopup extends StatefulWidget {
  const SkipTimerPopup({
    required this.minutes,
    required this.ideal,
    required this.submitProgress,
    super.key,
  });

  final int minutes;
  final int ideal;
  final ValueSetter<int> submitProgress;

  @override
  State<SkipTimerPopup> createState() => _SkipTimerStatePopup();
}

class _SkipTimerStatePopup extends State<SkipTimerPopup> {
  int minutes = 0;

  void submitProgress() {
    widget.submitProgress(minutes);
  }

  @override
  void initState() {
    super.initState();
    minutes = widget.minutes;
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).canvasColor,
      child: AspectRatio(
        aspectRatio: 1.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  '$minutes',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 48,
                      ),
                ),
                Text(
                  'minutes',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    'drag the slider to specify minutes',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Slider.adaptive(
                    thumbColor: Colors.orange,
                    activeColor: Colors.amber.shade300,
                    inactiveColor: Colors.amber.shade100,
                    max: widget.ideal.toDouble(),
                    value: minutes.toDouble(),
                    onChanged: (value) {
                      setState(
                        () => minutes = value.toInt(),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '0',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          '${widget.ideal}',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PrimaryButton(
              onPressed: submitProgress,
              text: 'Submit Score',
            ),
          ],
        ),
      ),
    );
  }
}
