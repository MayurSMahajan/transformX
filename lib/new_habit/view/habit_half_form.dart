import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/l10n/l10n.dart';
import 'package:transformx/new_habit/new_habit.dart';

class HabitHalfForm extends StatefulWidget {
  const HabitHalfForm({super.key});

  @override
  State<HabitHalfForm> createState() => _HabitHalfFormState();
}

class _HabitHalfFormState extends State<HabitHalfForm> {
  final habitRitualFocusNode = FocusNode();
  final habitRitualController = TextEditingController();
  final _habitRitualForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    habitRitualFocusNode.requestFocus();
  }

  @override
  void dispose() {
    habitRitualFocusNode.dispose();
    habitRitualController.dispose();
    super.dispose();
  }

  void submitInputs() {
    if (_habitRitualForm.currentState!.validate()) {
      context.read<NewHabitUICubit>().setStatusAndProgress(
            NewHabitUIStatus.quarterAndHalf,
            0.70,
          );
      context.read<NewHabitFormBloc>().add(
            HabitRitualChanged(habitRitualController.text),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Form(
        key: _habitRitualForm,
        child: Column(
          children: [
            const FormProgressContainer(),
            const _HabitRitualLabel(),
            const VSpace(),
            TextFormField(
              key: const Key('habitForm_ritualInput_textField'),
              focusNode: habitRitualFocusNode,
              controller: habitRitualController,
              decoration: InputDecoration(
                hintText: l10n.habitRitual,
              ),
              validator: HabitStringValidator.validateInput,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SecondaryButton(
                    onPressed: () {
                      context.read<NewHabitUICubit>().setStatusAndProgress(
                            NewHabitUIStatus.quarter,
                            0.25,
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
                )
              ],
            ),
            const VSpace(),
          ],
        ),
      ),
    );
  }
}

class _HabitRitualLabel extends StatelessWidget {
  const _HabitRitualLabel();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.butBeforStartingMyHabitResponseText,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              l10n.iWillDo1MinRitualResponseText,
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
      ],
    );
  }
}
