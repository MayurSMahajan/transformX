import 'dart:async';
import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_habits_api/firebase_habits_api.dart';
import 'package:firebase_track_api/firebase_track_api.dart';
import 'package:flutter/widgets.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:track_repository/track_repository.dart';
import 'package:transformx/app/view/app.dart';
import 'package:transformx/firebase_options.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    log('onEvent(${bloc.runtimeType}, $event)');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    log('onTransition(${bloc.runtimeType}, $transition)');
  }
}

Future<void> bootstrap() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = const AppBlocObserver();

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  final habitsRepository = HabitsRepository(habitsApi: FirebaseHabitsApi());

  final trackRepository = TrackRepository(trackApi: FirebaseTrackApi());
  // Add cross-flavor configuration here

  runApp(
    App(
      authenticationRepository: authenticationRepository,
      habitsRepository: habitsRepository,
      trackRepository: trackRepository,
    ),
  );
}
