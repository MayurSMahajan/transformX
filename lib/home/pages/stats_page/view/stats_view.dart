import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stats_repository/stats_repository.dart';
import 'package:transformx/home/pages/pages.dart';
import 'package:transformx/home/pages/stats_page/bloc/statistics_bloc.dart';

class StatsPageWrapper extends StatelessWidget {
  const StatsPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticsBloc(
        statsRepository: context.read<StatsRepository>(),
        userId: context.read<AuthenticationRepository>().savedUser.id,
      )..add(const StatisticsRequestedEvent()),
      child: const StatsPageView(),
    );
  }
}

class StatsPageView extends StatelessWidget {
  const StatsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsBloc, StatisticsState>(
      builder: (context, state) {
        if (state.status == StatisticsStatus.success) {
          if (state.stats.isEmpty) {
            return const StatsLoadedEmptyView();
          }
          return StatsLoadedView(statistics: state.stats);
        }
        if (state.status == StatisticsStatus.error) {
          return const StatsErrorView();
        }
        return const StatsLoadingView();
      },
    );
  }
}
