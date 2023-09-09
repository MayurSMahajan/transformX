import 'package:track_api/src/models/models.dart';

/// {@template track_api}
/// A track api which stores the track of the habits performance
/// {@endtemplate}
abstract class TrackApi {
  /// {@macro track_api}
  const TrackApi();

  /// Saves a `Track`.
  ///
  /// If a [track] with the same id already exists, it will be replaced.
  Future<void> saveTrack(Track track, String habitId);

  /// Provides a [Stream] of all track objects for the habit.
  Stream<Iterable<Track>> getAllTrack(String habitId);

  /// Provides a [Stream] of 7 track objects for the tracking weekly progress
  Stream<Iterable<Track>> getWeeklyTrack(String habitId);

  /// Provides a [Stream] of 30 track objects for the tracking weekly progress
  Stream<Iterable<Track>> getMonthlyTrack(String habitId);
}