import 'package:track_api/track_api.dart';

/// {@template track_repository}
/// A track repository which exposes the track api implementation to client side
/// {@endtemplate}
class TrackRepository {
  /// {@macro track_repository}
  const TrackRepository({
    required TrackApi trackApi,
  }) : _trackApi = trackApi;

  final TrackApi _trackApi;

  /// Saves a [Track].
  ///
  /// If a [Track] with the same id already exists, it will be replaced.
  Future<void> saveTrack(Track track, String habitId) =>
      _trackApi.saveTrack(track, habitId);

  /// Returns all the [Track]
  ///
  /// Returns them as a Stream.
  Stream<Iterable<Track>> getAllTrack(String habitId) =>
      _trackApi.getAllTrack(habitId);

  /// Returns a Iterable of only 7 [Track] objects.
  ///
  /// Returns them as a Stream.
  Stream<Iterable<Track>> getWeeklyTrack(String habitId) =>
      _trackApi.getOnlyCountTrack(habitId, 7);

  /// Returns a Iterable of only 31 [Track] objects.
  ///
  /// Returns them as a Stream.
  Stream<Iterable<Track>> getMonthlyTrack(String habitId) =>
      _trackApi.getOnlyCountTrack(habitId, 31);
}
