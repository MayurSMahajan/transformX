import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/new_habit/bloc/new_habit_form_bloc.dart';

class HabitCompleteForm extends StatelessWidget {
  const HabitCompleteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          const VSpace(),
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
    return BlocBuilder<NewHabitFormBloc, NewHabitFormState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Next'),
        );
      },
    );
  }
}
