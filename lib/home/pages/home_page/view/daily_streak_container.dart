import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stats_repository/stats_repository.dart';
import 'package:transformx/home/pages/home_page/cubit/streak_cubit.dart';
import 'package:transformx/home/pages/home_page/widgets/widgets.dart';
import 'package:transformx/infra/infra.dart';

class DailyStreakContainerWrapper extends StatelessWidget {
  const DailyStreakContainerWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StreakCubit(
        statsRepository: context.read<StatsRepository>(),
        userId: context.read<AuthenticationRepository>().currentUser.id,
      )..getStreak(),
      child: const DailyStreakContainer(),
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<StreakCubit, StreakState>(
          builder: (context, state) {
            if (state.status == StreakStatus.success) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DailyStreakCard(day: 'Mo', isActive: state.streakList[0]),
                  DailyStreakCard(day: 'Tu', isActive: state.streakList[1]),
                  DailyStreakCard(day: 'We', isActive: state.streakList[2]),
                  DailyStreakCard(day: 'Th', isActive: state.streakList[3]),
                  DailyStreakCard(day: 'Fr', isActive: state.streakList[4]),
                  DailyStreakCard(day: 'Sa', isActive: state.streakList[5]),
                  DailyStreakCard(day: 'Su', isActive: state.streakList[6]),
                ],
              );
            }
            if (state.status == StreakStatus.failure) {
              return Text(
                'Could Not Fetch your streak, try again',
                style: Theme.of(context).textTheme.bodyMedium,
              );
            }
            return const ProgressCircle();
          },
        ),
      ),
    );
  }
}