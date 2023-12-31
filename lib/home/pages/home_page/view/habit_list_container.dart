import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/home/pages/home_page/home_page.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/l10n/l10n.dart';

class HabitListContainer extends StatelessWidget {
  const HabitListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.habits,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const NewHabitCardBtn(),
          ],
        ),
        const VSpace(),
        SizedBox(
          child: BlocBuilder<HabitsBloc, HabitsState>(
            builder: (context, state) {
              if (state.status == AllHabitsStatus.success) {
                if (state.habits.isNotEmpty) {
                  return Column(
                    children: [
                      ...state.habits.map(
                        (e) => HabitCard(
                          habit: e,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Text(
                        l10n.createYourFirstHabitByClickingPlus,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }
              }
              if (state.status == AllHabitsStatus.failure) {
                return Text(
                  'Could Not Load your Habits, Try again later',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                );
              }
              return const ProgressCircle();
            },
          ),
        ),
      ],
    );
  }
}
