import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:track_api/track_api.dart';

/// Our [TrackEntity] is the representation of our track in Firestore.
/// The fromSnapshot and toDocument are methods specific to Firestore.
///
class TrackEntity {
  /// constructor
  const TrackEntity({
    this.id,
    this.trackedUpdate,
    this.didUseApp,
    this.timeStamp,
  });

  /// factory constructor to create a [TrackEntity] from Firestore
  factory TrackEntity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return TrackEntity(
      id: data?['id'] as String,
      trackedUpdate: data?['trackedUpdate'] as int,
      didUseApp: data?['didUseApp'] as bool,
      timeStamp: data?['dateTime'] as Timestamp,
    );
  }

  /// factory constructor to create a [TrackEntity] from [Track]
  factory TrackEntity.fromTrack(
    Track track,
  ) {
    return TrackEntity(
      id: track.id,
      trackedUpdate: track.trackedUpdate,
      didUseApp: track.didUseApp,
      timeStamp: Timestamp.fromDate(track.dateTime),
    );
  }

  /// an unique track id.
  final String? id;

  /// the trackedUpdate, the progress measured for today
  final int? trackedUpdate;

  /// specifies whether the user used the app or not.
  final bool? didUseApp;

  /// specifies the date time.
  final Timestamp? timeStamp;

  /// Method to convert [TrackEntity] to Map for storing in Firebase
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) 'id': id,
      if (trackedUpdate != null) 'trackedUpdate': trackedUpdate,
      if (didUseApp != null) 'didUseApp': didUseApp,
      if (timeStamp != null) 'dateTime': timeStamp,
    };
  }

  /// Converts the [TrackEntity] object to a new [Track] object
  Track toTrack() {
    return Track(
      id: id ?? '',
      trackedUpdate: trackedUpdate ?? 0,
      didUseApp: didUseApp ?? false,
      dateTime: timeStamp?.toDate() ?? DateTime.now(),
    );
  }
}
