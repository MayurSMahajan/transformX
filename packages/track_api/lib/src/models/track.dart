import 'package:uuid/uuid.dart';

/// `Track` is a class that stores the
/// `trackedUpdate` which is the performance value for a habit in some metric.
/// `didUseApp` is a boolean which determines if the user used the app.
/// `dateTime` stamp is useful since we want to store the date and the day.
class Track {
  /// `trackedUpdate` is mandatory as it specifies the performance in
  ///  unit metric, `dateTime` is also mandatory, `didUseApp` defaults to false
  /// meaning that the user did not open the app on that day.
  Track({
    required this.trackedUpdate,
    this.didUseApp = false,
    DateTime? dateTime,
    String? id,
  })  : assert(
          id == null || id.isNotEmpty,
          'id must either be null or not empty',
        ),
        id = id ?? const Uuid().v4(),
        dateTime = dateTime ?? DateTime.now();

  /// an unique id for the track object
  final String id;

  /// `trackedUpdate` which is the performance value for a habit in some metric.
  final int trackedUpdate;

  /// `dateTime` stamp is useful since we want to store the date and the day.
  final DateTime dateTime;

  /// `didUseApp` is a boolean which determines if the user used the app.
  final bool didUseApp;

  /// copy with utility
  Track copyWith({
    int? trackedUpdate,
    bool? didUseApp,
    DateTime? dateTime,
    String? id,
  }) {
    return Track(
      trackedUpdate: trackedUpdate ?? this.trackedUpdate,
      didUseApp: didUseApp ?? this.didUseApp,
      dateTime: dateTime ?? this.dateTime,
      id: id ?? this.id,
    );
  }
}
