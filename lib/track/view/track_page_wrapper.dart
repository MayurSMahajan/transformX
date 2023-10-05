import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:track_repository/track_repository.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/track/track.dart';

class TrackPageWrapper extends StatelessWidget {
  const TrackPageWrapper({required this.habit, super.key});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrackBloc(
        habitsRepository: context.read<HabitsRepository>(),
        tracksRepository: context.read<TrackRepository>(),
        userId: context.read<AuthenticationRepository>().savedUser.id,
        habit: habit,
      )..add(FetchLatestTrack()),
      child: TrackPageContent(habit: habit),
    );
  }
}

class TrackPageContent extends StatelessWidget {
  const TrackPageContent({required this.habit, super.key});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackBloc, TrackState>(
      builder: (context, state) {
        if (state.status == TrackStatus.fetched) {
          return TrackPage(
            track: state.tracks.isEmpty ? null : state.tracks.first,
            habit: habit,
          );
        }
        if (state.status == TrackStatus.error) {
          return const TrackError();
        }
        if (state.status == TrackStatus.success) {
          return TrackSuccess(
            shortReward: habit.shortReward,
          );
        }

        return const ProgressCircle();
      },
    );
  }
}
