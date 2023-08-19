import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/new_habit/cubit/new_habit_cubit.dart';

class HabitInitialForm extends StatelessWidget {
  const HabitInitialForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      color: Colors.pinkAccent,
      child: TextButton(
        child: const Text('Next'),
        onPressed: () {
          context.read<NewHabitCubit>().setStatus(
                NewHabitStatus.quarter,
              );
        },
      ),
    );
  }
}

class HabitQuarterForm extends StatelessWidget {
  const HabitQuarterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      color: Colors.purpleAccent,
      child: TextButton(
        child: const Text('Next'),
        onPressed: () {
          context.read<NewHabitCubit>().setStatus(
                NewHabitStatus.half,
              );
        },
      ),
    );
  }
}

class HabitHalfForm extends StatelessWidget {
  const HabitHalfForm({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<NewHabitCubit>().setStatus(
              NewHabitStatus.quarterAndHalf,
            );
      },
      child: Container(
        height: 300,
        width: 300,
        color: Colors.blueAccent,
      ),
    );
  }
}

class HabitQuarterAndHalfForm extends StatelessWidget {
  const HabitQuarterAndHalfForm({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<NewHabitCubit>().setStatus(
              NewHabitStatus.complete,
            );
      },
      child: Container(
        height: 300,
        width: 300,
        color: Colors.greenAccent,
      ),
    );
  }
}

class HabitCompleteForm extends StatelessWidget {
  const HabitCompleteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<NewHabitCubit>().setStatus(
              NewHabitStatus.created,
            );
      },
      child: Container(
        height: 300,
        width: 300,
        color: Colors.tealAccent,
      ),
    );
  }
}
