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
    required Habit habit,
  })  : _trackRepository = tracksRepository,
        _habitsRepository = habitsRepository,
        _userId = userId,
        _habit = habit,
        super(const TrackState()) {
    on<FetchLatestTrack>(_fetchLatestTrack);
    on<SaveTrack>(_saveTrack);
  }

  final String _userId;
  final Habit _habit;
  final TrackRepository _trackRepository;
  final HabitsRepository _habitsRepository;

  Future<void> _saveTrack(
    SaveTrack event,
    Emitter<TrackState> emit,
  ) async {
    emit(state.copyWith(status: () => TrackStatus.loading));
    try {
      var track = Track(trackedUpdate: 0);
      if (state.tracks.isNotEmpty) {
        track = state.tracks.first;
        if (track.isNotSameDate()) {
          _udpateHabitStats(track);
          track = Track(trackedUpdate: 0);
        }
      } else {
        // this means there are no track for this habit
        // thus we will create a new track and update the stats.
        _udpateHabitStats(track);
      }
      await _trackRepository.saveTrack(
        track: track.copyWith(
          didUseApp: true,
          trackedUpdate: event.trackedUpdate,
        ),
        habitId: _habit.id,
        userId: _userId,
      );
      emit(state.copyWith(status: () => TrackStatus.success));
    } catch (_) {
      emit(state.copyWith(status: () => TrackStatus.error));
    }
  }

  /// Increments the stats members and saves them.
  /// resets the streak to 1 if there was a gap of more than 24 hours
  void _udpateHabitStats(Track track) {
    final stats = Stats(
      streak: track.shouldResetStreak() ? 1 : _habit.stats.streak + 1,
      weeklyRecord: (_habit.stats.weeklyRecord + 1) % 7,
      monthlyRecord: (_habit.stats.monthlyRecord + 1) % 30,
      yearlyRecord: (_habit.stats.yearlyRecord + 1) % 365,
      allTimeRecord: _habit.stats.allTimeRecord + 1,
    );
    _habitsRepository.udpateHabitStats(_habit, _userId, stats);
  }

  Future<void> _fetchLatestTrack(
    FetchLatestTrack event,
    Emitter<TrackState> emit,
  ) async {
    emit(state.copyWith(status: () => TrackStatus.loading));

    await emit.forEach<Iterable<Track>>(
      _trackRepository.getLatestTrack(
        userId: _userId,
        habitId: _habit.id,
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
