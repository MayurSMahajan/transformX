import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/new_habit/new_habit.dart';

class HabitQuarterAndHalfForm extends StatelessWidget {
  const HabitQuarterAndHalfForm({super.key});

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
          _HabitShortRewardInput(),
          const VSpace(),
          _HabitLongRewardInput(),
          const Expanded(child: SizedBox()),
          const VSpace(),
          _NextButton(),
          const VSpace(),
        ],
      ),
    );
  }
}

class _HabitShortRewardInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'after i hit my daily goal,',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'i will reward myself',
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
              previous.habitShortReward != current.habitShortReward,
          builder: (context, state) {
            return TextField(
              key: const Key('habitForm_habitShortRewardInput_textField'),
              onChanged: (reward) => context
                  .read<NewHabitFormBloc>()
                  .add(HabitShortRewardChanged(reward)),
              decoration: InputDecoration(
                hintText: 'habit Short Reward',
                errorText: state.habitShortReward.displayError != null
                    ? 'invalid habit Short Reward'
                    : null,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _HabitLongRewardInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'my long term reward',
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
              previous.habitShortReward != current.habitShortReward,
          builder: (context, state) {
            return TextField(
              key: const Key('habitForm_habitLongRewardInput_textField'),
              onChanged: (reward) => context
                  .read<NewHabitFormBloc>()
                  .add(HabitLongRewardChanged(reward)),
              decoration: InputDecoration(
                hintText: 'habit Long Reward',
                errorText: state.habitLongReward.displayError != null
                    ? 'invalid habit Long Reward'
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
                        NewHabitUIStatus.complete,
                        0.95,
                      );
                }
              : null,
          child: const Text('Next'),
        );
      },
    );
  }
}
