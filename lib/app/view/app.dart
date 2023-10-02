import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:local_preferences_repository/local_preferences_repository.dart';
import 'package:stats_repository/stats_repository.dart';
import 'package:track_repository/track_repository.dart';
import 'package:transformx/app/app.dart';
import 'package:transformx/app/cubit/preferences_cubit.dart';
import 'package:transformx/app_ui/app_ui.dart';
import 'package:transformx/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    required HabitsRepository habitsRepository,
    required TrackRepository trackRepository,
    required StatsRepository statsRepository,
    required LocalPreferencesRepository preferencesRepository,
    super.key,
  })  : _authenticationRepository = authenticationRepository,
        _habitsRepository = habitsRepository,
        _trackRepository = trackRepository,
        _preferencesRepository = preferencesRepository,
        _statsRepository = statsRepository;

  final AuthenticationRepository _authenticationRepository;
  final HabitsRepository _habitsRepository;
  final TrackRepository _trackRepository;
  final StatsRepository _statsRepository;
  final LocalPreferencesRepository _preferencesRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authenticationRepository),
        RepositoryProvider.value(value: _habitsRepository),
        RepositoryProvider.value(value: _trackRepository),
        RepositoryProvider.value(value: _preferencesRepository),
        RepositoryProvider.value(value: _statsRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(
              authenticationRepository: _authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (context) => PreferencesCubit(
              localPreferencesRepository: _preferencesRepository,
            )..getDefaultPreferences(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesCubit, PreferencesState>(
      builder: (context, state) {
        return MaterialApp.router(
          themeMode: state.themeMode,
          theme: const AppTheme().themeData,
          darkTheme: const AppDarkTheme().themeData,
          locale: state.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          debugShowCheckedModeBanner: false,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: routerConfig,
        );
      },
    );
  }
}
