import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:track_repository/track_repository.dart';
import 'package:transformx/app/app.dart';
import 'package:transformx/app_ui/app_ui.dart';
import 'package:transformx/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    required HabitsRepository habitsRepository,
    required TrackRepository trackRepository,
    super.key,
  })  : _authenticationRepository = authenticationRepository,
        _habitsRepository = habitsRepository,
        _trackRepository = trackRepository;

  final AuthenticationRepository _authenticationRepository;
  final HabitsRepository _habitsRepository;
  final TrackRepository _trackRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authenticationRepository),
        RepositoryProvider.value(value: _habitsRepository),
        RepositoryProvider.value(value: _trackRepository),
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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: routerConfig,
    );
  }
}
