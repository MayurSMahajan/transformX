import 'package:freezed_annotation/freezed_annotation.dart';

part 'spot.freezed.dart';
part 'spot.g.dart';

/// A list of Track object
typedef Spots = List<Spot>;

/// `Spot` is a dart representation of FLSpot from the Fl_chart library.
@freezed
class Spot with _$Spot {
  /// Takes in a [x] for the x coordinate
  /// Takes in a [y] for the y coordinate
  const factory Spot({
    required double x,
    required double y,
  }) = _Spot;

  /// from JSON utility for `Spot`
  factory Spot.fromJson(Map<String, dynamic> json) => _$SpotFromJson(json);
}
