import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits_api/habits_api.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/l10n/l10n.dart';
import 'package:transformx/new_habit/new_habit.dart';

class HabitInitialForm extends StatefulWidget {
  const HabitInitialForm({super.key});

  @override
  State<HabitInitialForm> createState() => _HabitInitialFormState();
}

class _HabitInitialFormState extends State<HabitInitialForm> {
  final habitNameFocusNode = FocusNode();
  final habitLocationFocusNode = FocusNode();
  final habitNameController = TextEditingController();
  final habitLocationController = TextEditingController();

  final _habitCueForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    habitNameFocusNode.requestFocus();
  }

  @override
  void dispose() {
    habitNameFocusNode.dispose();
    habitLocationFocusNode.dispose();
    habitNameController.dispose();
    habitLocationController.dispose();
    super.dispose();
  }

  void _show(BuildContext ctx) {
    showModalBottomSheet<BottomSheet>(
      elevation: 10,
      context: ctx,
      builder: (ctx) => TimePickerWidget(
        onTimeSelected: onTimeSelected,
      ),
    );
  }

  void onTimeSelected(Time habitTime) {
    context.read<NewHabitFormBloc>().add(
          HabitTimeChanged(
            habitTime.hour,
            habitTime.mins,
            isAm: habitTime.isAm,
          ),
        );
    Navigator.of(context).pop();
  }

  void submitInputs() {
    if (_habitCueForm.currentState!.validate()) {
      context.read<NewHabitUICubit>().setStatusAndProgress(
            NewHabitUIStatus.quarter,
            0.25,
          );
      context.read<NewHabitFormBloc>().add(
            HabitNameChanged(habitNameController.text),
          );
      context.read<NewHabitFormBloc>().add(
            HabitLocationChanged(habitLocationController.text),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Form(
        key: _habitCueForm,
        child: Column(
          children: [
            const FormProgressContainer(),
            Row(
              children: [
                Text(
                  l10n.iWillCueText,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Expanded(
                  child: TextFormField(
                    key: const Key('habitForm_nameInput_textField'),
                    controller: habitNameController,
                    focusNode: habitNameFocusNode,
                    decoration: InputDecoration(
                      hintText: l10n.habitName,
                    ),
                    onEditingComplete: () {
                      habitNameFocusNode.unfocus();
                      habitLocationFocusNode.requestFocus();
                    },
                    validator: HabitStringValidator.validateInput,
                  ),
                ),
              ],
            ),
            const VSpace(),
            Row(
              children: [
                Text(
                  l10n.inCueText,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Expanded(
                  child: TextFormField(
                    key: const Key('habitForm_locationInput_textField'),
                    controller: habitLocationController,
                    focusNode: habitLocationFocusNode,
                    decoration: InputDecoration(
                      hintText: l10n.habitLocation,
                    ),
                    validator: HabitStringValidator.validateInput,
                  ),
                ),
              ],
            ),
            const VSpace(),
            const VSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'habit time',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                BlocBuilder<NewHabitFormBloc, NewHabitFormState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () => _show(context),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            state.habitTime.toReadableString(),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(width: 12),
                          const EditRoundedButton(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: submitInputs,
              child: Text(l10n.nextActionButton),
            ),
            const VSpace(),
          ],
        ),
      ),
    );
  }
}
