import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/l10n/l10n.dart';
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
          const VSpace(),
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
              onChanged: (ritual) => context
                  .read<NewHabitFormBloc>()
                  .add(HabitRitualChanged(ritual)),
              decoration: InputDecoration(
                hintText: l10n.habitRitual,
                errorText: state.habitRitual.displayError != null
                    ? l10n.invalidHabitRitual
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
    final l10n = context.l10n;
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
          child: Text(l10n.nextActionButton),
        );
      },
    );
  }
}
