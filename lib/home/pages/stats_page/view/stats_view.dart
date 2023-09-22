import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/app_ui/app_ui.dart';
import 'package:transformx/home/pages/pages.dart';
import 'package:transformx/home/pages/stats_page/bloc/statistics_bloc.dart';

class StatsPageView extends StatelessWidget {
  const StatsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final child = BlocBuilder<StatisticsBloc, StatisticsState>(
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

    return ResponsiveLayout(
      mobileBody: child,
      desktopBody: Center(
        child: SizedBox(
          width: 500,
          height: 800,
          child: SingleChildScrollView(child: child),
        ),
      ),
    );
  }
}
