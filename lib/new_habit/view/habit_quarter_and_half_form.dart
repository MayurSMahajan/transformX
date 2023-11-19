// ignore_for_file: unnecessary_statements

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
  final LocalNotificationService notificationService =
      LocalNotificationService();

  final shortRewardFocusNode = FocusNode();
  final longRewardFocusNode = FocusNode();
  final shortRewardController = TextEditingController();
  final longRewardController = TextEditingController();

  final _habitRewardForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    shortRewardFocusNode.requestFocus();
    notificationService.initializeNotifications();
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
            HabitLongRewardChanged(longRewardController.text),
          );
      context.read<NewHabitFormBloc>().add(const HabitSubmitted());
      _setNotificationReminder();
    }
  }

  void _setNotificationReminder() {
    int hour;
    int mins;
    String title;
    String body;
    (title, body, hour, mins) =
        context.read<NewHabitFormBloc>().getNotificationDetails();
    notificationService.scheduleNotification(title, body, hour, mins);
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
                  children: [
                    Text(
                      l10n.iWillRewardMyselfRewardText,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const QuestionWithTooltip(
                      message: 'Long Term Reward Meaning',
                    ),
                  ],
                ),
                TextFormField(
                  key: const Key('habitForm_shortRewardInput_textField'),
                  controller: shortRewardController,
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
            const VSpace(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      l10n.myLongTermRewardRewardText,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const QuestionWithTooltip(
                      message: 'Long Term Reward Meaning',
                    ),
                  ],
                ),
                TextFormField(
                  key: const Key('habitForm_longRewardInput_textField'),
                  controller: longRewardController,
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
                Expanded(
                  child: SecondaryButton(
                    onPressed: () {
                      context.read<NewHabitUICubit>().setStatusAndProgress(
                            NewHabitUIStatus.half,
                            0.5,
                          );
                    },
                    label: 'back',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: NextButton(
                    onPressed: submitInputs,
                  ),
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
