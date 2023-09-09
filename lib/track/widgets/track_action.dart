import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transformx/infra/infra.dart';
import 'package:transformx/track/cubit/track_cubit.dart';

class HabitTrackAction extends StatelessWidget {
  const HabitTrackAction({required this.progress, super.key});

  final int progress;

  void submitTrack(BuildContext context) {
    context.read<TrackCubit>().submitTrack(progress);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrimaryButton(
          onPressed: () => submitTrack(context),
          text: 'Submit Score',
        ),
      ],
    );
  }
}
