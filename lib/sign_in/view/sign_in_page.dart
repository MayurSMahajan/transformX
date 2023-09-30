import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:local_preferences_repository/local_preferences_repository.dart';
import 'package:transformx/l10n/l10n.dart';
import 'package:transformx/sign_in/cubit/sign_in_cubit.dart';
import 'package:transformx/sign_in/sign_in.dart';

class SignInPageBuilder extends StatelessWidget {
  const SignInPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => SignInCubit(
            authenticationRepository: context.read<AuthenticationRepository>(),
            preferencesRepository: context.read<LocalPreferencesRepository>(),
          )..shouldShowOnboarding(),
          child: const SignInPage(),
        ),
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.status == SignInStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? l10n.authenticationFailure),
              ),
            );
        }
        if (state.status == SignInStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Signed In Successfully'),
              ),
            );
          context.go('/');
        }
      },
      builder: (context, state) {
        if (state.status == SignInStatus.initial) {
          return const CircularProgressIndicator.adaptive();
        }
        if (state.status == SignInStatus.onboarding) {
          return const OnboardingPage();
        }
        return const SignInView();
      },
    );
  }
}
