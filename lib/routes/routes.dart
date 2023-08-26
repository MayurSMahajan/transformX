import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transformx/habit_track/view/habit_track_page.dart';
import 'package:transformx/home_page/home_page.dart';
import 'package:transformx/new_habit/new_habit.dart';

final GoRouter routerConfig = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Change the opacity of the screen using a Curve based
            //on the the animation's value
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
                // Change the opacity of the screen using a Curve based
                // on the the animation's value
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
            debugPrint(state.pageKey.toString());
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
  ],
);
