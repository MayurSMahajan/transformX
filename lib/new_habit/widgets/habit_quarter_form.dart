import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/l10n/l10n.dart';
import 'package:transformx/new_habit/new_habit.dart';
import 'package:transformx/app_ui/app_ui.dart';

class HabitQuarterForm extends StatefulWidget {
  const HabitQuarterForm({super.key});

  @override
  State<HabitQuarterForm> createState() => _HabitQuarterFormState();
}

class _HabitQuarterFormState extends State<HabitQuarterForm> {
  final metricMinFocusNode = FocusNode();
  final metricIdealFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    metricMinFocusNode.requestFocus();
  }

  @override
  void dispose() {
    metricMinFocusNode.dispose();
    metricIdealFocusNode.dispose();
    super.dispose();
  }

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
          const _HabitMetricTitleInput(),
          const VSpace(),
          _HabitMetricMinInput(
            focusNode: metricMinFocusNode,
            onSubmit: metricIdealFocusNode.requestFocus,
          ),
          const VSpace(),
          _HabitMetricIdealInput(
            focusNode: metricIdealFocusNode,
            onSubmit: () {},
          ),
          const Expanded(child: SizedBox()),
          const VSpace(),
          NextButton(
            onPressed: () {
              context.read<NewHabitUICubit>().setStatusAndProgress(
                    NewHabitUIStatus.half,
                    0.5,
                  );
            },
          ),
          const VSpace(),
        ],
      ),
    );
  }
}

class _HabitMetricTitleInput extends StatelessWidget {
  const _HabitMetricTitleInput();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.myHabit,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              l10n.habitCanBeTrackedInCraveText,
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
        Text(
          l10n.minutes,
          style: UITextStyle.headline4.copyWith(
            color: AppColors.mediumEmphasisSurface,
          ),
        ),
      ],
    );
  }
}

class _HabitMetricMinInput extends StatelessWidget {
  const _HabitMetricMinInput({
    required this.focusNode,
    required this.onSubmit,
  });

  final FocusNode focusNode;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.minDailyTargetCraveText,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        BlocBuilder<NewHabitFormBloc, NewHabitFormState>(
          buildWhen: (previous, current) =>
              previous.habitMetricMin != current.habitMetricMin,
          builder: (context, state) {
            return TextField(
              key: const Key('habitForm_habitMetricMinInput_textField'),
              focusNode: focusNode,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: l10n.habitMetricMin,
                errorText: state.habitMetricMin.displayError != null
                    ? l10n.invalidHabitMetricMin
                    : null,
              ),
              onChanged: (min) => context.read<NewHabitFormBloc>().add(
                    HabitMetricMinChanged(
                      int.parse(min),
                    ),
                  ),
              onSubmitted: (_) => onSubmit,
            );
          },
        ),
      ],
    );
  }
}

class _HabitMetricIdealInput extends StatelessWidget {
  const _HabitMetricIdealInput({
    required this.focusNode,
    required this.onSubmit,
  });

  final FocusNode focusNode;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.idealDailyTargetCraveText,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        BlocBuilder<NewHabitFormBloc, NewHabitFormState>(
          buildWhen: (previous, current) =>
              previous.habitMetricIdeal != current.habitMetricIdeal,
          builder: (context, state) {
            return TextField(
              key: const Key('habitForm_habitMetricIdealInput_textField'),
              focusNode: focusNode,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: l10n.habitMetricIdeal,
                errorText: state.habitMetricIdeal.displayError != null
                    ? l10n.invalidHabitMetricIdeal
                    : null,
              ),
              onChanged: (min) => context.read<NewHabitFormBloc>().add(
                    HabitMetricIdealChanged(
                      int.parse(min),
                    ),
                  ),
              onSubmitted: (_) => onSubmit,
            );
          },
        ),
      ],
    );
  }
}
