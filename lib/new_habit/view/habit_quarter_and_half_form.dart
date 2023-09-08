import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/l10n/l10n.dart';
import 'package:transformx/new_habit/new_habit.dart';

class HabitQuarterAndHalfForm extends StatefulWidget {
  const HabitQuarterAndHalfForm({super.key});

  @override
  State<HabitQuarterAndHalfForm> createState() =>
      _HabitQuarterAndHalfFormState();
}

class _HabitQuarterAndHalfFormState extends State<HabitQuarterAndHalfForm> {
  final shortRewardFocusNode = FocusNode();
  final longRewardFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    shortRewardFocusNode.requestFocus();
  }

  @override
  void dispose() {
    shortRewardFocusNode.dispose();
    longRewardFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          const FormProgressContainer(),
          Column(
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
                    focusNode: shortRewardFocusNode,
                    decoration: InputDecoration(
                      hintText: l10n.habitShortReward,
                      errorText: state.habitShortReward.displayError != null
                          ? l10n.invalidHabitShortReward
                          : null,
                    ),
                    onChanged: (reward) => context.read<NewHabitFormBloc>().add(
                          HabitShortRewardChanged(reward),
                        ),
                    onEditingComplete: () {
                      shortRewardFocusNode.unfocus();
                      longRewardFocusNode.requestFocus();
                    },
                  );
                },
              ),
            ],
          ),
          Column(
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
                    focusNode: longRewardFocusNode,
                    decoration: InputDecoration(
                      hintText: l10n.habitLongReward,
                      errorText: state.habitLongReward.displayError != null
                          ? l10n.invalidhHabitLongReward
                          : null,
                    ),
                    onChanged: (reward) => context.read<NewHabitFormBloc>().add(
                          HabitLongRewardChanged(reward),
                        ),
                  );
                },
              ),
            ],
          ),
          const Spacer(),
          const VSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrevButton(
                onPressed: () {
                  context.read<NewHabitUICubit>().setStatusAndProgress(
                        NewHabitUIStatus.half,
                        0.5,
                      );
                },
              ),
              NextButton(
                onPressed: () {
                  context.read<NewHabitFormBloc>().add(const HabitSubmitted());
                  context.read<NewHabitUICubit>().setStatusAndProgress(
                        NewHabitUIStatus.complete,
                        0.95,
                      );
                },
              ),
            ],
          ),
          const VSpace(),
        ],
      ),
    );
  }
}
