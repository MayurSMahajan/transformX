part of 'track_bloc.dart';

sealed class TrackEvent extends Equatable {
  const TrackEvent();

  @override
  List<Object> get props => [];
}

class FetchLatestTrack extends TrackEvent {}

class SaveTrack extends TrackEvent {
  const SaveTrack({
    required this.trackedUpdate,
  });

  final int trackedUpdate;
}
