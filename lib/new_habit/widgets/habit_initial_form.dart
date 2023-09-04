import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  void initState() {
    super.initState();
    habitNameFocusNode.requestFocus();
  }

  @override
  void dispose() {
    habitNameFocusNode.dispose();
    habitLocationFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
          Row(
            children: [
              Text(
                l10n.iWillCueText,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Expanded(
                child: BlocBuilder<NewHabitFormBloc, NewHabitFormState>(
                  buildWhen: (previous, current) =>
                      previous.habitName != current.habitName,
                  builder: (context, state) {
                    return TextField(
                      key: const Key('habitForm_habitNameInput_textField'),
                      focusNode: habitNameFocusNode,
                      decoration: InputDecoration(
                        hintText: l10n.habitName,
                        errorText: state.habitName.displayError != null
                            ? l10n.invalidHabitName
                            : null,
                      ),
                      onChanged: (name) => context.read<NewHabitFormBloc>().add(
                            HabitNameChanged(name),
                          ),
                      onEditingComplete: () {
                        habitNameFocusNode.unfocus();
                        habitLocationFocusNode.requestFocus();
                      },
                    );
                  },
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
                child: BlocBuilder<NewHabitFormBloc, NewHabitFormState>(
                  buildWhen: (previous, current) =>
                      previous.habitLocation != current.habitLocation,
                  builder: (context, state) {
                    return TextField(
                      key: const Key('habitForm_habitLocationInput_textField'),
                      focusNode: habitLocationFocusNode,
                      decoration: InputDecoration(
                        hintText: l10n.habitLocation,
                        errorText: state.habitLocation.displayError != null
                            ? l10n.invalidLocation
                            : null,
                      ),
                      onChanged: (location) =>
                          context.read<NewHabitFormBloc>().add(
                                HabitLocationChanged(location),
                              ),
                    );
                  },
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          const VSpace(),
          NextButton(
            onPressed: () {
              context.read<NewHabitUICubit>().setStatusAndProgress(
                    NewHabitUIStatus.quarter,
                    0.25,
                  );
            },
          ),
          const VSpace(),
        ],
      ),
    );
  }
}
