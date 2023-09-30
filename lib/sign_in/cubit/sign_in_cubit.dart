import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_preferences_repository/local_preferences_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required AuthenticationRepository authenticationRepository,
    required LocalPreferencesRepository preferencesRepository,
  })  : _authenticationRepository = authenticationRepository,
        _preferencesRepository = preferencesRepository,
        super(const SignInState());

  final AuthenticationRepository _authenticationRepository;
  final LocalPreferencesRepository _preferencesRepository;

  Future<void> shouldShowOnboarding() async {
    try {
      final ans = await _preferencesRepository.getShowOnboarding();
      if (ans) {
        emit(state.copyWith(status: SignInStatus.onboarding));
      } else {
        emit(state.copyWith(status: SignInStatus.inProgress));
      }
    } catch (_) {
      emit(state.copyWith(status: SignInStatus.inProgress));
    }
  }

  Future<void> setShowOnboarding({bool show = false}) async {
    try {
      await _preferencesRepository.setShowOnboarding(show: show);
    } catch (_) {
      log('Could not set Show Onboarding to false');
    }
    emit(state.copyWith(status: SignInStatus.inProgress));
  }

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: SignInStatus.inProgress));
    try {
      await _authenticationRepository.logInWithGoogle();
      emit(state.copyWith(status: SignInStatus.success));
    } on LogInWithGoogleFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: SignInStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: SignInStatus.failure));
    }
  }
}
