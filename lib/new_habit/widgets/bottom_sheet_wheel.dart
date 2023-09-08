import 'package:flutter/material.dart';
import 'package:transformx/new_habit/widgets/bottom_sheet_wheel_tile.dart';

class BottomSheetWheel extends StatelessWidget {
  const BottomSheetWheel({
    required this.controller,
    required this.offset,
    required this.childCount,
    super.key,
  });

  final FixedExtentScrollController controller;
  final int offset;
  final int childCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 54,
        perspective: 0.005,
        diameterRatio: 1.2,
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: childCount,
          builder: (context, index) {
            return MetricValue(
              value: index + offset,
            );
          },
        ),
      ),
    );
  }
}
