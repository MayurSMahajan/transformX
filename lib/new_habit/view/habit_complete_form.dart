import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/l10n/l10n.dart';
import 'package:transformx/new_habit/new_habit.dart';

class HabitCompleteForm extends StatelessWidget {
  const HabitCompleteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewHabitFormBloc, NewHabitFormState>(
      builder: (context, state) {
        if (state.status == NewHabitFormStatus.success) {
          return const HabitCompleteFormSuccessfull();
        }
        if (state.status == NewHabitFormStatus.failure) {
          return const HabitCompleteFailure();
        }
        return const ProgressCircle();
      },
    );
  }
}

class HabitCompleteFormSuccessfull extends StatelessWidget {
  const HabitCompleteFormSuccessfull({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              const VSpace(),
              const CustomProgressIndicator(progress: 1),
              const VSpace(),
              Image.asset('assets/illustrations/baloon.png', height: 350),
            ],
          ),
          Positioned(
            bottom: 40,
            child: SizedBox(
              height: 240,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'New Habit Added!',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    l10n.greatSuccessText,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 64),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NextButton(
                        onPressed: () => context.go('/'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HabitCompleteFailure extends StatelessWidget {
  const HabitCompleteFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Some problem occured',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 64),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NextButton(
                onPressed: () => context.go('/'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
