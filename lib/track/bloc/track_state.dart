part of 'track_bloc.dart';

enum TrackStatus {
  initial,
  fetched,
  loading,
  success,
  error,
}

final class TrackState extends Equatable {
  const TrackState({
    this.status = TrackStatus.initial,
    this.tracks = const [],
  });

  final TrackStatus status;
  final Iterable<Track> tracks;

  TrackState copyWith({
    TrackStatus Function()? status,
    int Function()? streak,
    Iterable<Track> Function()? tracks,
  }) {
    return TrackState(
      status: status != null ? status() : this.status,
      tracks: tracks != null ? tracks() : this.tracks,
    );
  }

  @override
  List<Object> get props => [status, tracks];
}
