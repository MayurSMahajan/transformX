import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits_api/habits_api.dart';
import 'package:track_repository/track_repository.dart';
import 'package:transformx/track/cubit/track_cubit.dart';
import 'package:transformx/track/view/track_page.dart';
import 'package:transformx/track/view/track_success_page.dart';

class TrackPageWrapper extends StatelessWidget {
  const TrackPageWrapper({required this.habit, super.key});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrackCubit(
        trackRepository: context.read<TrackRepository>(),
        habitsId: habit.id,
      ),
      child: const TrackPageContent(),
    );
  }
}

class TrackPageContent extends StatelessWidget {
  const TrackPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackCubit, TrackState>(
      builder: (context, state) {
        if (state.status == TrackStatus.initial) {
          return const TrackPage();
        }
        if (state.status == TrackStatus.success) {
          return const TrackSuccess();
        }
        if (state.status == TrackStatus.error) {
          return const TrackError();
        }
        return const CircularProgressIndicator.adaptive();
      },
    );
  }
}

class TrackError extends StatelessWidget {
  const TrackError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Some problem occured'),
      ),
    );
  }
}
