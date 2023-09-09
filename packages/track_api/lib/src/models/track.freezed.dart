// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Track _$TrackFromJson(Map<String, dynamic> json) {
  return _Track.fromJson(json);
}

/// @nodoc
mixin _$Track {
  int get trackedUpdate => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  bool get didUseApp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackCopyWith<Track> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackCopyWith<$Res> {
  factory $TrackCopyWith(Track value, $Res Function(Track) then) =
      _$TrackCopyWithImpl<$Res, Track>;
  @useResult
  $Res call({int trackedUpdate, DateTime dateTime, bool didUseApp});
}

/// @nodoc
class _$TrackCopyWithImpl<$Res, $Val extends Track>
    implements $TrackCopyWith<$Res> {
  _$TrackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackedUpdate = null,
    Object? dateTime = null,
    Object? didUseApp = null,
  }) {
    return _then(_value.copyWith(
      trackedUpdate: null == trackedUpdate
          ? _value.trackedUpdate
          : trackedUpdate // ignore: cast_nullable_to_non_nullable
              as int,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      didUseApp: null == didUseApp
          ? _value.didUseApp
          : didUseApp // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrackCopyWith<$Res> implements $TrackCopyWith<$Res> {
  factory _$$_TrackCopyWith(_$_Track value, $Res Function(_$_Track) then) =
      __$$_TrackCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int trackedUpdate, DateTime dateTime, bool didUseApp});
}

/// @nodoc
class __$$_TrackCopyWithImpl<$Res> extends _$TrackCopyWithImpl<$Res, _$_Track>
    implements _$$_TrackCopyWith<$Res> {
  __$$_TrackCopyWithImpl(_$_Track _value, $Res Function(_$_Track) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackedUpdate = null,
    Object? dateTime = null,
    Object? didUseApp = null,
  }) {
    return _then(_$_Track(
      trackedUpdate: null == trackedUpdate
          ? _value.trackedUpdate
          : trackedUpdate // ignore: cast_nullable_to_non_nullable
              as int,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      didUseApp: null == didUseApp
          ? _value.didUseApp
          : didUseApp // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Track implements _Track {
  const _$_Track(
      {required this.trackedUpdate,
      required this.dateTime,
      this.didUseApp = false});

  factory _$_Track.fromJson(Map<String, dynamic> json) =>
      _$$_TrackFromJson(json);

  @override
  final int trackedUpdate;
  @override
  final DateTime dateTime;
  @override
  @JsonKey()
  final bool didUseApp;

  @override
  String toString() {
    return 'Track(trackedUpdate: $trackedUpdate, dateTime: $dateTime, didUseApp: $didUseApp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Track &&
            (identical(other.trackedUpdate, trackedUpdate) ||
                other.trackedUpdate == trackedUpdate) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.didUseApp, didUseApp) ||
                other.didUseApp == didUseApp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, trackedUpdate, dateTime, didUseApp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrackCopyWith<_$_Track> get copyWith =>
      __$$_TrackCopyWithImpl<_$_Track>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrackToJson(
      this,
    );
  }
}

abstract class _Track implements Track {
  const factory _Track(
      {required final int trackedUpdate,
      required final DateTime dateTime,
      final bool didUseApp}) = _$_Track;

  factory _Track.fromJson(Map<String, dynamic> json) = _$_Track.fromJson;

  @override
  int get trackedUpdate;
  @override
  DateTime get dateTime;
  @override
  bool get didUseApp;
  @override
  @JsonKey(ignore: true)
  _$$_TrackCopyWith<_$_Track> get copyWith =>
      throw _privateConstructorUsedError;
}
