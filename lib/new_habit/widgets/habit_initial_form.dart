import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/new_habit/new_habit.dart';

class HabitInitialForm extends StatelessWidget {
  const HabitInitialForm({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.select(
      (NewHabitUICubit cubit) => cubit.state.progress,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          const VSpace(),
          CustomProgressIndicator(progress: progress),
          const VSpace(),
          _HabitNameInput(),
          const VSpace(),
          _HabitLocationInput(),
          const Expanded(child: SizedBox()),
          const VSpace(),
          _NextButton(),
          const VSpace(),
        ],
      ),
    );
  }
}

class _HabitNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'I will ',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Expanded(
          child: BlocBuilder<NewHabitFormBloc, NewHabitFormState>(
            buildWhen: (previous, current) =>
                previous.habitName != current.habitName,
            builder: (context, state) {
              return TextField(
                key: const Key('habitForm_habitNameInput_textField'),
                onChanged: (name) => context
                    .read<NewHabitFormBloc>()
                    .add(HabitNameChanged(name)),
                decoration: InputDecoration(
                  hintText: 'habitname',
                  errorText: state.habitName.displayError != null
                      ? 'invalid habitname'
                      : null,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _HabitLocationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'in ',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Expanded(
          child: BlocBuilder<NewHabitFormBloc, NewHabitFormState>(
            buildWhen: (previous, current) =>
                previous.habitLocation != current.habitLocation,
            builder: (context, state) {
              return TextField(
                key: const Key('habitForm_habitLocationInput_textField'),
                onChanged: (location) => context
                    .read<NewHabitFormBloc>()
                    .add(HabitLocationChanged(location)),
                decoration: InputDecoration(
                  hintText: 'habitlocation',
                  errorText: state.habitLocation.displayError != null
                      ? 'invalid location'
                      : null,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewHabitFormBloc, NewHabitFormState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.isValid
              ? () {
                  context.read<NewHabitUICubit>().setStatusAndProgress(
                        NewHabitUIStatus.quarter,
                        0.25,
                      );
                }
              : null,
          child: const Text('Next'),
        );
      },
    );
  }
}
