import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/new_habit/new_habit.dart';

class FormProgressContainer extends StatelessWidget {
  const FormProgressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewHabitUICubit, NewHabitUIState>(
      builder: (context, state) {
        return Column(
          children: [
            const VSpace(),
            CustomProgressIndicator(progress: state.progress),
            const VSpace(),
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }
}
