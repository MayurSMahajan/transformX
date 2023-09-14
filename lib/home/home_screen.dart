import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:stats_repository/stats_repository.dart';
import 'package:transformx/home/pages/home_page/bloc/habits_bloc.dart';
import 'package:transformx/home/pages/pages.dart';
import 'package:transformx/home/pages/stats_page/bloc/statistics_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HabitsBloc>(
          create: (context) => HabitsBloc(
            habitsRepository: context.read<HabitsRepository>(),
            userId: context.read<AuthenticationRepository>().savedUser.id,
          )..add(const HabitsSubscriptionRequested()),
        ),
        BlocProvider<StatisticsBloc>(
          create: (context) => StatisticsBloc(
            statsRepository: context.read<StatsRepository>(),
            userId: context.read<AuthenticationRepository>().savedUser.id,
          )..add(const StatisticsRequestedEvent()),
        ),
      ],
      child: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          elevation: 2,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.graphic_eq),
              icon: Icon(Icons.graphic_eq_outlined),
              label: 'Stats',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person_2),
              icon: Icon(Icons.person_2_outlined),
              label: 'Settings',
            ),
          ],
        ),
        body: <Widget>[
          const HomeView(),
          const StatsPageView(),
          const ProfilePage(),
        ][currentPageIndex],
      ),
    );
  }
}
