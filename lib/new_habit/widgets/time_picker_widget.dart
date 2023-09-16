import 'package:flutter/material.dart';
import 'package:habits_api/habits_api.dart';
import 'package:transformx/new_habit/widgets/widgets.dart';

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

  void submitTime() {
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
      height: 320,
      child: Column(
        children: [
          SizedBox(
            height: 240,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const BottomSheetOverlay(paddingTop: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BottomSheetWheel(
                      controller: _hourController,
                      offset: 0,
                      childCount: 13,
                    ),
                    const SizedBox(width: 25),
                    BottomSheetWheel(
                      controller: _minsController,
                      offset: 0,
                      childCount: 61,
                    ),
                    const SizedBox(width: 25),
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
          const SizedBox(height: 6),
          BottomSheetButton(onPressed: submitTime),
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
