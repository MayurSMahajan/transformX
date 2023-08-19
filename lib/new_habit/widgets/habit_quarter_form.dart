import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/new_habit/new_habit.dart';

class HabitQuarterForm extends StatelessWidget {
  const HabitQuarterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.select(
      (NewHabitCubit cubit) => cubit.state.progress,
    );

    return Column(
      children: [
        CustomProgressIndicator(progress: progress),
        const VSpace(),
        Container(
          height: 300,
          width: 300,
          color: Colors.purpleAccent,
          child: TextButton(
            child: const Text('Next'),
            onPressed: () {
              context.read<NewHabitCubit>().setStatusAndProgress(
                    NewHabitStatus.half,
                    0.50,
                  );
            },
          ),
        ),
      ],
    );
  }
}
