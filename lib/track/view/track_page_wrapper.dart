import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:track_repository/track_repository.dart';
import 'package:transformx/track/bloc/track_bloc.dart';
import 'package:transformx/track/view/track_page.dart';
import 'package:transformx/track/view/track_success_page.dart';

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
      child: const TrackPageContent(),
    );
  }
}

class TrackPageContent extends StatelessWidget {
  const TrackPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TrackBloc, TrackState>(
          builder: (context, state) {
            if (state.status == TrackStatus.fetched) {
              return TrackPage(
                track: state.tracks.isEmpty ? null : state.tracks.first,
              );
            }
            if (state.status == TrackStatus.success) {
              return const TrackSuccess();
            }
            if (state.status == TrackStatus.error) {
              return const TrackError();
            }
            return const WaitingIndicator();
          },
        ),
      ),
    );
  }
}

class TrackError extends StatelessWidget {
  const TrackError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Some problem occured'),
    );
  }
}

class WaitingIndicator extends StatelessWidget {
  const WaitingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
