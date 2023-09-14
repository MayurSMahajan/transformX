import 'package:flutter/material.dart';

class StatsLoadedEmptyView extends StatelessWidget {
  const StatsLoadedEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Create a new habit to see stats 😉'),
    );
  }
}
