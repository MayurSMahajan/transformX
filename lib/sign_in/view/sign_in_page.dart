import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:local_preferences_repository/local_preferences_repository.dart';
import 'package:transformx/app_ui/app_ui.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/l10n/l10n.dart';
import 'package:transformx/sign_in/cubit/sign_in_cubit.dart';
import 'package:transformx/sign_in/sign_in.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
          child: const SignInPageView(),
        ),
      ),
    );
  }
}

class SignInPageView extends StatelessWidget {
  const SignInPageView({super.key});

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

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            const VSpace(),
            Image.asset('assets/logo/logo.png', height: 264, width: 264),
            const VSpace(),
            Text(
              'Start Transforming',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const VSpace(),
            Text(
              'Unlock your journey to a happier self',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const _GoogleLoginButton(),
      ],
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  const _GoogleLoginButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final child = Padding(
      padding: const EdgeInsets.all(20),
      child: OutlinedButton.icon(
        key: const Key('loginForm_googleLogin_raisedButton'),
        label: Text(
          l10n.signInWithGoogle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        icon:
            SvgPicture.asset('assets/icons/google.svg', width: 22, height: 22),
        onPressed: () => context.read<SignInCubit>().logInWithGoogle(),
      ),
    );

    return ResponsiveLayout(
      mobileBody: child,
      desktopBody: Center(child: SizedBox(width: 400, child: child)),
    );
  }
}
