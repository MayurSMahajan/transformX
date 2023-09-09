import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_track_api/src/entities/entities.dart';
import 'package:track_api/track_api.dart';

/// {@template firebase_track_api}
/// A firebase implementation of the track api
/// {@endtemplate}
class FirebaseTrackApi implements TrackApi {
  /// {@macro firebase_track_api}
  FirebaseTrackApi();

  /// The Firebase Firestore instance.
  final db = FirebaseFirestore.instance.collection('data');

  @override
  Future<void> saveTrack(Track track, String habitId) {
    final trackDoc = db.doc(habitId).collection('tracks').doc(track.id);
    final trackEntityMap = TrackEntity.fromTrack(track).toFirestore();
    return trackDoc.set(trackEntityMap);
  }

  @override
  Stream<Iterable<Track>> getAllTrack(String habitId) {
    final tracksCollection =
        db.doc(habitId).collection('tracks').orderBy('dateTime');
    final ans = tracksCollection.snapshots().map(
          (snapshot) => snapshot.docs.map(
            (e) => TrackEntity.fromFirestore(e).toTrack(),
          ),
        );
    return ans;
  }

  @override
  Stream<Iterable<Track>> getMonthlyTrack(String habitId) {
    final tracksCollection =
        db.doc(habitId).collection('tracks').orderBy('dateTime').limit(30);
    final ans = tracksCollection.snapshots().map(
          (snapshot) => snapshot.docs.map(
            (e) => TrackEntity.fromFirestore(e).toTrack(),
          ),
        );
    return ans;
  }

  @override
  Stream<Iterable<Track>> getWeeklyTrack(String habitId) {
    final tracksCollection =
        db.doc(habitId).collection('tracks').orderBy('dateTime').limit(7);
    final ans = tracksCollection.snapshots().map(
          (snapshot) => snapshot.docs.map(
            (e) => TrackEntity.fromFirestore(e).toTrack(),
          ),
        );
    return ans;
  }
}
