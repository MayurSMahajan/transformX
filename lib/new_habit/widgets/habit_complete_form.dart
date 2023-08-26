import 'package:flutter/material.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/new_habit/new_habit.dart';

class HabitCompleteForm extends StatelessWidget {
  const HabitCompleteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          const CustomProgressIndicator(progress: 1),
          const VSpace(),
          Text(
            'Great\n Remember true change begins within',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Expanded(child: SizedBox()),
          const VSpace(),
          _NextButton(),
          const VSpace(),
        ],
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Next'),
    );
  }
}
