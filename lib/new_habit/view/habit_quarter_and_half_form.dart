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
  final shortRewardController = TextEditingController();
  final longRewardController = TextEditingController();

  final _habitRewardForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    shortRewardFocusNode.requestFocus();
  }

  @override
  void dispose() {
    shortRewardFocusNode.dispose();
    longRewardFocusNode.dispose();
    shortRewardController.dispose();
    longRewardController.dispose();
    super.dispose();
  }

  void submitInputs() {
    if (_habitRewardForm.currentState!.validate()) {
      context.read<NewHabitUICubit>().setStatusAndProgress(
            NewHabitUIStatus.complete,
            0.95,
          );
      context.read<NewHabitFormBloc>().add(
            HabitShortRewardChanged(shortRewardController.text),
          );
      context.read<NewHabitFormBloc>().add(
            HabitLongRewardChanged(shortRewardController.text),
          );
      context.read<NewHabitFormBloc>().add(const HabitSubmitted());
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Form(
        key: _habitRewardForm,
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
                TextFormField(
                  key: const Key('habitForm_shortRewardInput_textField'),
                  focusNode: shortRewardFocusNode,
                  decoration: InputDecoration(
                    hintText: l10n.habitShortReward,
                  ),
                  onEditingComplete: () {
                    shortRewardFocusNode.unfocus();
                    longRewardFocusNode.requestFocus();
                  },
                  validator: HabitStringValidator.validateInput,
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
                TextFormField(
                  key: const Key('habitForm_longRewardInput_textField'),
                  focusNode: longRewardFocusNode,
                  decoration: InputDecoration(
                    hintText: l10n.habitLongReward,
                  ),
                  validator: HabitStringValidator.validateInput,
                ),
              ],
            ),
            const Spacer(),
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
                  onPressed: submitInputs,
                ),
              ],
            ),
            const VSpace(),
          ],
        ),
      ),
    );
  }
}
