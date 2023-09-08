import 'package:flutter/material.dart';
import 'package:transformx/infra/infra.dart';

class HabitStackAction extends StatelessWidget {
  const HabitStackAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrimaryButton(onPressed: () {}, text: 'Start Tracking'),
      ],
    );
  }
}
