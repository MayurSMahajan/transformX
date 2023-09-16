import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
        Text(
          l10n.habits,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const VSpace(),
        SizedBox(
          child: BlocBuilder<HabitsBloc, HabitsState>(
            builder: (context, state) {
              if (state.status == AllHabitsStatus.success) {
                if (state.habits.isNotEmpty) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...state.habits.map(
                          (e) => HabitCard(
                            habit: e,
                          ),
                        ),
                        const NewHabitCardBtn(),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      Text(
                        l10n.createYourFirstHabitByClickingPlus,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 275,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.black,
                              onPressed: () => context.go('/new'),
                              child: const Icon(Icons.add),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }
              }
              if (state.status == AllHabitsStatus.failure) {
                return Container(
                  color: Colors.red,
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
