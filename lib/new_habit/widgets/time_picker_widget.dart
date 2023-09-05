import 'package:flutter/material.dart';
import 'package:transformx/infra/infra.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      height: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 60,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 70,
                child: ListWheelScrollView.useDelegate(
                  controller: _controller,
                  itemExtent: 54,
                  perspective: 0.005,
                  diameterRatio: 1.2,
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 13,
                    builder: (context, index) {
                      return MyHours(
                        hours: index,
                      );
                    },
                  ),
                ),
              ),
              const HSpace(),
              SizedBox(
                width: 70,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 54,
                  perspective: 0.005,
                  diameterRatio: 1.2,
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 60,
                    builder: (context, index) {
                      return MyMinutes(
                        mins: index,
                      );
                    },
                  ),
                ),
              ),
              const HSpace(),
              SizedBox(
                width: 70,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  perspective: 0.005,
                  diameterRatio: 1.2,
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 2,
                    builder: (context, index) {
                      if (index == 0) {
                        return const AmPm(
                          isItAm: true,
                        );
                      } else {
                        return const AmPm(
                          isItAm: false,
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AmPm extends StatelessWidget {
  const AmPm({required this.isItAm, super.key});

  final bool isItAm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Text(
          isItAm == true ? 'am' : 'pm',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHours extends StatelessWidget {
  const MyHours({required this.hours, super.key});

  final int hours;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Text(
          hours.toString(),
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyMinutes extends StatelessWidget {
  const MyMinutes({required this.mins, super.key});

  final int mins;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Text(
          mins < 10 ? '0$mins' : mins.toString(),
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
