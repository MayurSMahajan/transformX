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
  Future<void> saveTrack({
    required Track track,
    required String habitId,
    required String userId,
  }) =>
      _trackApi.saveTrack(
        habitId: habitId,
        userId: userId,
        track: track,
      );

  /// Returns all the [Track]
  ///
  /// Returns them as a Stream.
  Stream<Iterable<Track>> getAllTrack({
    required String habitId,
    required String userId,
  }) =>
      _trackApi.getAllTrack(habitId: habitId, userId: userId);

  /// Returns a Iterable of only 7 [Track] objects.
  ///
  /// Returns them as a Stream.
  Stream<Iterable<Track>> getLatestTrack({
    required String habitId,
    required String userId,
  }) =>
      _trackApi.getOnlyCountTrack(
        habitId: habitId,
        userId: userId,
        count: 1,
      );

  /// Returns a Iterable of only 7 [Track] objects.
  ///
  /// Returns them as a Stream.
  Stream<Iterable<Track>> getWeeklyTrack({
    required String habitId,
    required String userId,
  }) =>
      _trackApi.getOnlyCountTrack(
        habitId: habitId,
        userId: userId,
        count: 7,
      );

  /// Returns a Iterable of only 31 [Track] objects.
  ///
  /// Returns them as a Stream.
  Stream<Iterable<Track>> getMonthlyTrack({
    required String habitId,
    required String userId,
  }) =>
      _trackApi.getOnlyCountTrack(
        habitId: habitId,
        userId: userId,
        count: 30,
      );
}
