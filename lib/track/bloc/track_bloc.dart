import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habits_repository/habits_repository.dart';
import 'package:track_repository/track_repository.dart';
import 'package:transformx/infra/extensions/extensions.dart';

part 'track_event.dart';
part 'track_state.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  TrackBloc({
    required TrackRepository tracksRepository,
    required HabitsRepository habitsRepository,
    required String userId,
    required String habitId,
  })  : _trackRepository = tracksRepository,
        _habitsRepository = habitsRepository,
        _userId = userId,
        _habitId = habitId,
        super(const TrackState()) {
    on<FetchLatestTrack>(_fetchLatestTrack);
    on<SaveTrack>(_saveTrack);
  }

  final String _userId;
  final String _habitId;
  final TrackRepository _trackRepository;
  final HabitsRepository _habitsRepository;

  Future<void> _saveTrack(
    SaveTrack event,
    Emitter<TrackState> emit,
  ) async {
    emit(state.copyWith(status: () => TrackStatus.loading));
    try {
      Track track;
      if (state.tracks.isEmpty) {
        track = Track(trackedUpdate: 0);
      } else {
        // now check if the track fetched is not of current date.
        track = state.tracks.first;
        if (track.dateTime.isNotSameDate()) {
          track = Track(trackedUpdate: 0);
          if (track.dateTime.shouldResetStreak()) {
            // call the habits api and reset the streak.
          } else {
            // call the habits api and increment the streak.
          }
        }
      }
      await _trackRepository.saveTrack(
        track: track.copyWith(
          didUseApp: true,
          trackedUpdate: event.trackedUpdate,
        ),
        habitId: _habitId,
        userId: _userId,
      );
      emit(state.copyWith(status: () => TrackStatus.success));
    } catch (_) {
      emit(state.copyWith(status: () => TrackStatus.error));
    }
  }

  Future<void> _fetchLatestTrack(
    FetchLatestTrack event,
    Emitter<TrackState> emit,
  ) async {
    emit(state.copyWith(status: () => TrackStatus.loading));

    await emit.forEach<Iterable<Track>>(
      _trackRepository.getLatestTrack(
        userId: _userId,
        habitId: _habitId,
      ),
      onData: (tracks) => state.copyWith(
        status: () => TrackStatus.fetched,
        tracks: () => tracks,
      ),
      onError: (_, __) => state.copyWith(
        status: () => TrackStatus.error,
      ),
    );
  }
}
