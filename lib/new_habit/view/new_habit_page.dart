import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/new_habit/cubit/new_habit_cubit.dart';
import 'package:transformx/new_habit/widgets/habit_initial.dart';

class NewHabitPage extends StatelessWidget {
  const NewHabitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewHabitCubit(),
      child: const NewHabitView(),
    );
  }
}

class NewHabitView extends StatelessWidget {
  const NewHabitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //progress indicator
            Padding(
              padding: const EdgeInsets.all(14),
              child: Container(
                color: Colors.amber,
              ),
            ),
            Center(
              child: BlocBuilder<NewHabitCubit, NewHabitState>(
                builder: (context, state) {
                  switch (state.status) {
                    case NewHabitStatus.initial:
                      return const HabitInitialForm();
                    case NewHabitStatus.quarter:
                      return const HabitQuarterForm();
                    case NewHabitStatus.half:
                      return const HabitHalfForm();
                    case NewHabitStatus.quarterAndHalf:
                      return const HabitQuarterAndHalfForm();
                    case NewHabitStatus.complete:
                      return const HabitCompleteForm();
                    case NewHabitStatus.created:
                      return Container(
                        color: Colors.indigo,
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
