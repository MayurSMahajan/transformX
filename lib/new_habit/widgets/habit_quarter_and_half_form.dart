import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/new_habit/new_habit.dart';

class HabitQuarterAndHalfForm extends StatelessWidget {
  const HabitQuarterAndHalfForm({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.select(
      (NewHabitUICubit cubit) => cubit.state.progress,
    );
    return Column(
      children: [
        CustomProgressIndicator(progress: progress),
        const VSpace(),
        InkWell(
          onTap: () {
            context.read<NewHabitUICubit>().setStatusAndProgress(
                  NewHabitUIStatus.complete,
                  0.95,
                );
          },
          child: Container(
            height: 300,
            width: 300,
            color: Colors.greenAccent,
          ),
        ),
      ],
    );
  }
}
