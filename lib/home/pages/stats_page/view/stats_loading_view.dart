import 'package:flutter/material.dart';
import 'package:transformx/infra/infra.dart';

class StatsLoadingView extends StatelessWidget {
  const StatsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProgressCircle(),
        VSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Crunching some numbers, for you 😉'),
          ],
        ),
      ],
    );
  }
}
