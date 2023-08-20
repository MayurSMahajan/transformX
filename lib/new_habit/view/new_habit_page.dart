import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/new_habit/new_habit.dart';

class NewHabitPage extends StatelessWidget {
  const NewHabitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewHabitUICubit>(
          create: (_) => NewHabitUICubit(),
        ),
        BlocProvider<NewHabitFormBloc>(
          create: (_) => NewHabitFormBloc(),
        ),
      ],
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
        child: BlocBuilder<NewHabitUICubit, NewHabitUIState>(
          builder: (context, state) {
            switch (state.status) {
              case NewHabitUIStatus.initial:
                return const HabitInitialForm();
              case NewHabitUIStatus.quarter:
                return const HabitQuarterForm();
              case NewHabitUIStatus.half:
                return const HabitHalfForm();
              case NewHabitUIStatus.quarterAndHalf:
                return const HabitQuarterAndHalfForm();
              case NewHabitUIStatus.complete:
                return Container(
                  color: Colors.indigo,
                );
            }
          },
        ),
      ),
    );
  }
}
