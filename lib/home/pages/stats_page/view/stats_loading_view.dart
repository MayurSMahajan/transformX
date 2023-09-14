import 'package:flutter/material.dart';

class StatsLoadingView extends StatelessWidget {
  const StatsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator.adaptive(),
        SizedBox(height: 16),
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
