import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habits_api/habits_api.dart';
import 'package:transformx/app/app.dart';
import 'package:transformx/home/home.dart';
import 'package:transformx/new_habit/new_habit.dart';
import 'package:transformx/overview/overview.dart';
import 'package:transformx/sign_in/sign_in.dart';
import 'package:transformx/track/track.dart';

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
          path: 'overview',
          pageBuilder: (context, state) {
            final habit = state.extra as Habit?;
            return CustomTransitionPage(
              key: state.pageKey,
              child: OverviewPage(
                habit: habit,
              ),
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
        GoRoute(
          path: 'ritual',
          pageBuilder: (context, state) {
            final habit = state.extra! as Habit;
            return CustomTransitionPage(
              key: state.pageKey,
              child: TrackRitualPage(habit: habit),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(
                    curve: Curves.easeIn,
                  ).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: 'progress',
          pageBuilder: (context, state) {
            final habit = state.extra! as Habit;
            return CustomTransitionPage(
              key: state.pageKey,
              child: TrackPageWrapper(habit: habit),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(
                    curve: Curves.easeIn,
                  ).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: 'success',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const TrackSuccess(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(
                    curve: Curves.easeIn,
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
          child: const SignInPageBuilder(),
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
