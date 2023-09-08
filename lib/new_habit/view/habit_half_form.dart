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

  @override
  void initState() {
    super.initState();
    habitRitualFocusNode.requestFocus();
  }

  @override
  void dispose() {
    habitRitualFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          const FormProgressContainer(),
          _HabitRitualInput(focusNode: habitRitualFocusNode),
          const Spacer(),
          const VSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrevButton(
                onPressed: () {
                  context.read<NewHabitUICubit>().setStatusAndProgress(
                        NewHabitUIStatus.quarter,
                        0.25,
                      );
                },
              ),
              NextButton(
                onPressed: () {
                  context.read<NewHabitUICubit>().setStatusAndProgress(
                        NewHabitUIStatus.quarterAndHalf,
                        0.70,
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

class _HabitRitualInput extends StatelessWidget {
  const _HabitRitualInput({
    required this.focusNode,
  });

  final FocusNode focusNode;

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
        BlocBuilder<NewHabitFormBloc, NewHabitFormState>(
          buildWhen: (previous, current) =>
              previous.habitRitual != current.habitRitual,
          builder: (context, state) {
            return TextField(
              key: const Key('habitForm_habitRitualInput_textField'),
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: l10n.habitRitual,
                errorText: state.habitRitual.displayError != null
                    ? l10n.invalidHabitRitual
                    : null,
              ),
              onChanged: (ritual) => context.read<NewHabitFormBloc>().add(
                    HabitRitualChanged(ritual),
                  ),
            );
          },
        ),
      ],
    );
  }
}
