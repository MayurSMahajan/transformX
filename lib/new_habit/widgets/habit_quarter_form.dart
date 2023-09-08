import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits_api/habits_api.dart';
import 'package:transformx/app_ui/app_ui.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/l10n/l10n.dart';
import 'package:transformx/new_habit/new_habit.dart';

class HabitQuarterForm extends StatefulWidget {
  const HabitQuarterForm({super.key});

  @override
  State<HabitQuarterForm> createState() => _HabitQuarterFormState();
}

class _HabitQuarterFormState extends State<HabitQuarterForm> {
  void _show(BuildContext ctx) {
    showModalBottomSheet<BottomSheet>(
      elevation: 10,
      context: ctx,
      builder: (ctx) => MetricPickerWidget(
        onMetricSelected: onMetricSelected,
      ),
    );
  }

  void onMetricSelected(Metric habitMetric) {
    context.read<NewHabitFormBloc>().add(
          HabitMetricIdealChanged(habitMetric.ideal),
        );
    context.read<NewHabitFormBloc>().add(
          HabitMetricMinChanged(habitMetric.minimum),
        );
    Navigator.of(context).pop();
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VSpace(),
          CustomProgressIndicator(progress: progress),
          const VSpace(),
          const _HabitMetricTitleInput(),
          const VSpace(),
          Text(
            'habit metrics',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const VSpace(),
          BlocBuilder<NewHabitFormBloc, NewHabitFormState>(
            builder: (context, state) {
              return Column(
                children: [
                  SelectedValueTile(
                    label: 'minimum',
                    amount: '${state.habitMetricMin.value}',
                    subLabel: l10n.minutes,
                  ),
                  const VSpace(),
                  SelectedValueTile(
                    label: 'ideal',
                    amount: '${state.habitMetricIdeal.value}',
                    subLabel: l10n.minutes,
                  ),
                ],
              );
            },
          ),
          const VSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton.tonal(
                onPressed: () => _show(context),
                child: const Text('Change Metric'),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          const VSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrevButton(
                onPressed: () {
                  context.read<NewHabitUICubit>().setStatusAndProgress(
                        NewHabitUIStatus.initial,
                        0,
                      );
                },
              ),
              NextButton(
                onPressed: () {
                  context.read<NewHabitUICubit>().setStatusAndProgress(
                        NewHabitUIStatus.half,
                        0.5,
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
