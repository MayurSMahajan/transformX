import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transformx/app_ui/app_ui.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/l10n/l10n.dart';
import 'package:transformx/sign_in/cubit/sign_in_cubit.dart';

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
