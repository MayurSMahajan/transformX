import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/new_habit/new_habit.dart';

class HabitHalfForm extends StatelessWidget {
  const HabitHalfForm({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.select(
      (NewHabitUICubit cubit) => cubit.state.progress,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          CustomProgressIndicator(progress: progress),
          const VSpace(),
          _HabitRitualInput(),
          const Expanded(child: SizedBox()),
          const VSpace(),
          _NextButton(),
          const VSpace(),
        ],
      ),
    );
  }
}

class _HabitRitualInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'but before starting my habit',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'i will do a 1-min ritual',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.question_mark_rounded,
                size: 14,
              ),
            )
          ],
        ),
        BlocBuilder<NewHabitFormBloc, NewHabitFormState>(
          buildWhen: (previous, current) =>
              previous.habitRitual != current.habitRitual,
          builder: (context, state) {
            return TextField(
              key: const Key('habitForm_habitRitualInput_textField'),
              onChanged: (ritual) => context
                  .read<NewHabitFormBloc>()
                  .add(HabitRitualChanged(ritual)),
              decoration: InputDecoration(
                hintText: 'habit ritual',
                errorText: state.habitRitual.displayError != null
                    ? 'invalid habit ritual'
                    : null,
              ),
            );
          },
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
                        NewHabitUIStatus.quarterAndHalf,
                        0.70,
                      );
                }
              : null,
          child: const Text('Next'),
        );
      },
    );
  }
}
