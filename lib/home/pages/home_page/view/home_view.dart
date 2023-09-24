import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:transformx/home/pages/home_page/home_page.dart';
import 'package:transformx/infra/infra.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HabitsBloc>(
      create: (context) => HabitsBloc(
        habitsRepository: context.read<HabitsRepository>(),
        userId: context.read<AuthenticationRepository>().savedUser.id,
      )..add(const HabitsSubscriptionRequested()),
      child: const HomeViewContent(),
    );
  }
}

class HomeViewContent extends StatelessWidget {
  const HomeViewContent({super.key});

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
            DailyStreakContainerWrapper(),
            VSpace(),
            HabitListContainer(),
          ],
        ),
      ),
    );
  }
}
