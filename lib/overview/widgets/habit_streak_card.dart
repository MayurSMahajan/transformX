import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stats_repository/stats_repository.dart';

import 'package:transformx/overview/cubit/single_streak_cubit.dart';

class HabitStreakWrapper extends StatelessWidget {
  const HabitStreakWrapper({required this.habitId, super.key});

  final String habitId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingleStreakCubit(
        statsRepository: context.read<StatsRepository>(),
        userId: context.read<AuthenticationRepository>().currentUser.id,
      )..getHabitStreak(habitId),
      child: const HabitStreak(),
    );
  }
}

class HabitStreak extends StatelessWidget {
  const HabitStreak({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 60,
      child: Column(
        children: [
          const FaIcon(
            FontAwesomeIcons.fire,
            size: 32,
            color: Colors.orange,
          ),
          BlocBuilder<SingleStreakCubit, SingleStreakState>(
            builder: (context, state) {
              return Text(
                state.count.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              );
            },
          ),
        ],
      ),
    );
  }
}
