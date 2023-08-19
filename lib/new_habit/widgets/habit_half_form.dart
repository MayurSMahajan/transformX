import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/new_habit/new_habit.dart';

class HabitHalfForm extends StatelessWidget {
  const HabitHalfForm({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.select(
      (NewHabitCubit cubit) => cubit.state.progress,
    );

    return Column(
      children: [
        CustomProgressIndicator(progress: progress),
        const VSpace(),
        InkWell(
          onTap: () {
            context.read<NewHabitCubit>().setStatusAndProgress(
                  NewHabitStatus.quarterAndHalf,
                  0.75,
                );
          },
          child: Container(
            height: 300,
            width: 300,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}
