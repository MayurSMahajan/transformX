import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:transformx/app/app.dart';
import 'package:transformx/habit_track/view/habit_track_page.dart';
import 'package:transformx/home/home.dart';
import 'package:transformx/new_habit/new_habit.dart';
import 'package:transformx/sign_in/sign_in.dart';

final GoRouter routerConfig = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'new',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const NewHabitPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: 'track',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const HabitTrackPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(
                    curve: Curves.easeOutSine,
                  ).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/signin',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const SignInPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(
                curve: Curves.easeOutSine,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],

  // redirect to the sign in page if the user has not signed in
  redirect: (BuildContext context, GoRouterState state) {
    final authStatus = context.read<AppBloc>().state.status;
    final signedIn = state.matchedLocation == '/signin';

    if (authStatus == AppStatus.unauthenticated) {
      return '/signin';
    }

    if (signedIn) {
      return '/';
    }

    return null;
  },
);
