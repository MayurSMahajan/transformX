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
  Future<void> saveTrack({
    required Track track,
    required String habitId,
    required String userId,
  }) {
    final trackDoc = db.doc(userId).collection(habitId).doc(track.id);
    final trackEntityMap = TrackEntity.fromTrack(track).toFirestore();
    return trackDoc.set(trackEntityMap);
  }

  @override
  Stream<Iterable<Track>> getAllTrack({
    required String habitId,
    required String userId,
  }) {
    final tracksCollection = db
        .doc(userId)
        .collection(habitId)
        .orderBy('dateTime', descending: true);

    final ans = tracksCollection.snapshots().map(
          (snapshot) => snapshot.docs.map(
            (e) => TrackEntity.fromFirestore(e).toTrack(),
          ),
        );
    return ans;
  }

  @override
  Stream<Iterable<Track>> getOnlyCountTrack({
    required int count,
    required String habitId,
    required String userId,
  }) {
    final tracksCollection = db
        .doc(userId)
        .collection(habitId)
        .orderBy('dateTime', descending: true)
        .limit(count);

    final ans = tracksCollection.snapshots().map(
          (snapshot) => snapshot.docs.map(
            (e) => TrackEntity.fromFirestore(e).toTrack(),
          ),
        );
    return ans;
  }
}
