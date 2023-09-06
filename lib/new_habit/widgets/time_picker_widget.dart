import 'package:flutter/material.dart';
import 'package:habits_api/habits_api.dart';
import 'package:transformx/infra/infra.dart';

class TimePickerWidgetWrapper extends StatelessWidget {
  const TimePickerWidgetWrapper({required this.onTimeSelected, super.key});

  final ValueSetter<Time> onTimeSelected;

  @override
  Widget build(BuildContext context) {
    return TimePickerWidget(onTimeSelected: onTimeSelected);
  }
}

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({required this.onTimeSelected, super.key});

  final ValueSetter<Time> onTimeSelected;

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minsController;
  late FixedExtentScrollController _amPmController;

  @override
  void initState() {
    super.initState();
    _hourController = FixedExtentScrollController();
    _minsController = FixedExtentScrollController();
    _amPmController = FixedExtentScrollController();
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minsController.dispose();
    _amPmController.dispose();
    super.dispose();
  }

  void submitTime(BuildContext context) {
    final habitTime = Time(
      hour: _hourController.selectedItem,
      mins: _minsController.selectedItem,
      isAm: _amPmController.selectedItem.isEven,
    );
    widget.onTimeSelected(habitTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      height: 300,
      child: Column(
        children: [
          SizedBox(
            height: 240,
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
                        controller: _hourController,
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
                        controller: _minsController,
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
                        controller: _amPmController,
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
          ),
          FilledButton.tonal(
            onPressed: () => submitTime(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('Done'),
            ),
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
