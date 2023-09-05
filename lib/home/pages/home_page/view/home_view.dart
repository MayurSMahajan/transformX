import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:transformx/home/pages/home_page/bloc/habits_bloc.dart';
import 'package:transformx/home/pages/home_page/widgets/widgets.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/l10n/l10n.dart';

class HomeViewWrapper extends StatelessWidget {
  const HomeViewWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HabitsBloc(
        habitsRepository: context.read<HabitsRepository>(),
        userId: context.read<AuthenticationRepository>().savedUser.id,
      )..add(const HabitsSubscriptionRequested()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            VSpace(),
            GreetingContainer(),
            VSpace(),
            DailyStreakContainer(),
            VSpace(),
            HabitListContainer(),
          ],
        ),
      ),
    );
  }
}

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
                        height: 300,
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

class DailyStreakContainer extends StatelessWidget {
  const DailyStreakContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).canvasColor,
      ),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DailyStreakCard(day: 'Mo', isActive: true),
            DailyStreakCard(day: 'Tu', isActive: true),
            DailyStreakCard(day: 'We'),
            DailyStreakCard(day: 'Th', isActive: true),
            DailyStreakCard(day: 'Fr', isActive: true),
            DailyStreakCard(day: 'Sa', isActive: true),
            DailyStreakCard(day: 'Su'),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'TransformX',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.amberAccent,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_2),
          ),
        )
      ],
    );
  }
}

class GreetingContainer extends StatelessWidget {
  const GreetingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Text(
      l10n.goodMorningGreet,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
