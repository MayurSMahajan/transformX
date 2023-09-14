import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:stats_repository/stats_repository.dart';
import 'package:track_repository/track_repository.dart';
import 'package:transformx/app/app.dart';
import 'package:transformx/app_ui/app_ui.dart';
import 'package:transformx/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    required HabitsRepository habitsRepository,
    required TrackRepository trackRepository,
    required StatsRepository statsRepository,
    super.key,
  })  : _authenticationRepository = authenticationRepository,
        _habitsRepository = habitsRepository,
        _trackRepository = trackRepository,
        _statsRepository = statsRepository;

  final AuthenticationRepository _authenticationRepository;
  final HabitsRepository _habitsRepository;
  final TrackRepository _trackRepository;
  final StatsRepository _statsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authenticationRepository),
        RepositoryProvider.value(value: _habitsRepository),
        RepositoryProvider.value(value: _trackRepository),
        RepositoryProvider.value(value: _statsRepository),
      ],
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.light,
      theme: const AppTheme().themeData,
      // darkTheme: const AppDarkTheme().themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: routerConfig,
    );
  }
}
