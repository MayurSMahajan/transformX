import 'package:freezed_annotation/freezed_annotation.dart';

part 'track.freezed.dart';
part 'track.g.dart';

/// `Track` is a class that stores the
/// `trackedUpdate` which is the performance value for a habit in some metric.
/// `didUseApp` is a boolean which determines if the user used the app.
/// `dateTime` stamp is useful since we want to store the date and the day.
@freezed
class Track with _$Track {
  /// `trackedUpdate` is mandatory as it specifies the performance in
  ///  unit metric, `dateTime` is also mandatory, `didUseApp` defaults to false
  /// meaning that the user did not open the app on that day.
  const factory Track({
    required String id,
    required int trackedUpdate,
    required DateTime dateTime,
    @Default(false) bool didUseApp,
  }) = _Track;

  /// An Utility to carry out the json serialization for `Track` object.
  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}
