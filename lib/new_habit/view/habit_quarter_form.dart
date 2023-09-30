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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormProgressContainer(),
          const _HabitMetricTitleInput(),
          const VSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'habit metrics',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              InkWell(
                onTap: () => _show(context),
                child: const EditRoundedButton(),
              ),
            ],
          ),
          const VSpace(),
          BlocBuilder<NewHabitFormBloc, NewHabitFormState>(
            builder: (context, state) {
              return Column(
                children: [
                  SelectedValueTile(
                    label: 'minimum',
                    amount: '${state.habitMetricMin}',
                    subLabel: l10n.minutes,
                  ),
                  const VSpace(),
                  SelectedValueTile(
                    label: 'ideal',
                    amount: '${state.habitMetricIdeal}',
                    subLabel: l10n.minutes,
                  ),
                ],
              );
            },
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: SecondaryButton(
                  onPressed: () {
                    context.read<NewHabitUICubit>().setStatusAndProgress(
                          NewHabitUIStatus.initial,
                          0,
                        );
                  },
                  label: 'back',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: NextButton(
                  onPressed: () {
                    context.read<NewHabitUICubit>().setStatusAndProgress(
                          NewHabitUIStatus.half,
                          0.5,
                        );
                  },
                ),
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
          children: [
            Text(
              l10n.habitCanBeTrackedInCraveText,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const QuestionWithTooltip(
              message:
                  'Metrics is a unit in which you will track your progress',
            ),
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
