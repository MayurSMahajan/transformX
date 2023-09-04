import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/l10n/l10n.dart';
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
          const VSpace(),
          CustomProgressIndicator(progress: progress),
          const VSpace(),
          _HabitShortRewardInput(),
          const VSpace(),
          _HabitLongRewardInput(),
          const Expanded(child: SizedBox()),
          const VSpace(),
          NextButton(
            onPressed: () {
              context.read<NewHabitFormBloc>().add(const HabitSubmitted());
              context.read<NewHabitUICubit>().setStatusAndProgress(
                    NewHabitUIStatus.complete,
                    0.95,
                  );
            },
          ),
          const VSpace(),
        ],
      ),
    );
  }
}

class _HabitShortRewardInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.afterIHitMyDailyGoalRewardText,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              l10n.iWillRewardMyselfRewardText,
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
                hintText: l10n.habitShortReward,
                errorText: state.habitShortReward.displayError != null
                    ? l10n.invalidHabitShortReward
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
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              l10n.myLongTermRewardRewardText,
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
                hintText: l10n.habitLongReward,
                errorText: state.habitLongReward.displayError != null
                    ? l10n.invalidhHabitLongReward
                    : null,
              ),
            );
          },
        ),
      ],
    );
  }
}
