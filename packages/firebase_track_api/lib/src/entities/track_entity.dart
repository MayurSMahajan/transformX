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
    this.dateTime,
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
      dateTime: data?['dateTime'] as DateTime,
    );
  }

  /// factory constructor to create a [TrackEntity] from [Track]
  factory TrackEntity.fromTrack(
    Track track,
  ) {
    return TrackEntity(
      trackedUpdate: track.trackedUpdate,
      didUseApp: track.didUseApp,
      dateTime: track.dateTime,
    );
  }

  /// an unique track id.
  final String? id;

  /// the trackedUpdate, the progress measured for today
  final int? trackedUpdate;

  /// specifies whether the user used the app or not.
  final bool? didUseApp;

  /// specifies the date time.
  final DateTime? dateTime;

  /// Method to convert [TrackEntity] to Map for storing in Firebase
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) 'id': id,
      if (trackedUpdate != null) 'trackedUpdate': trackedUpdate,
      if (didUseApp != null) 'didUseApp': didUseApp,
      if (dateTime != null) 'dateTime': dateTime,
    };
  }

  /// Converts the [TrackEntity] object to a new [Track] object
  Track toTrack() {
    return Track(
      id: id ?? '',
      trackedUpdate: trackedUpdate ?? 0,
      didUseApp: didUseApp ?? false,
      dateTime: dateTime ?? DateTime.now(),
    );
  }
}
