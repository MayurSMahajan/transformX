import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:track_repository/track_repository.dart';

enum TrackStatus {
  initial,
  progress,
  success,
  error,
}

final class TrackState extends Equatable {
  const TrackState({
    this.status = TrackStatus.initial,
  });

  final TrackStatus status;

  TrackState copyWith({
    TrackStatus? status,
  }) {
    return TrackState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}

class TrackCubit extends Cubit<TrackState> {
  TrackCubit({
    required this.habitsId,
    required TrackRepository trackRepository,
  })  : _trackRepository = trackRepository,
        super(const TrackState());

  final TrackRepository _trackRepository;
  final String habitsId;

  /// Submits the [Track]
  void submitTrack(int progress) {
    emit(const TrackState().copyWith(status: TrackStatus.progress));
    try {
      final track = Track(trackedUpdate: progress, didUseApp: true);
      _trackRepository.saveTrack(track, habitsId);
      emit(const TrackState().copyWith(status: TrackStatus.success));
    } catch (_) {
      emit(const TrackState().copyWith(status: TrackStatus.error));
    }
  }
}
