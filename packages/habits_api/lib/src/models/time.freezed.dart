// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Time _$TimeFromJson(Map<String, dynamic> json) {
  return _Time.fromJson(json);
}

/// @nodoc
mixin _$Time {
  int get hour => throw _privateConstructorUsedError;
  int get mins => throw _privateConstructorUsedError;
  bool get isAm => throw _privateConstructorUsedError;
  bool get is24hour => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeCopyWith<Time> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeCopyWith<$Res> {
  factory $TimeCopyWith(Time value, $Res Function(Time) then) =
      _$TimeCopyWithImpl<$Res, Time>;
  @useResult
  $Res call({int hour, int mins, bool isAm, bool is24hour});
}

/// @nodoc
class _$TimeCopyWithImpl<$Res, $Val extends Time>
    implements $TimeCopyWith<$Res> {
  _$TimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? mins = null,
    Object? isAm = null,
    Object? is24hour = null,
  }) {
    return _then(_value.copyWith(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      mins: null == mins
          ? _value.mins
          : mins // ignore: cast_nullable_to_non_nullable
              as int,
      isAm: null == isAm
          ? _value.isAm
          : isAm // ignore: cast_nullable_to_non_nullable
              as bool,
      is24hour: null == is24hour
          ? _value.is24hour
          : is24hour // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimeCopyWith<$Res> implements $TimeCopyWith<$Res> {
  factory _$$_TimeCopyWith(_$_Time value, $Res Function(_$_Time) then) =
      __$$_TimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int mins, bool isAm, bool is24hour});
}

/// @nodoc
class __$$_TimeCopyWithImpl<$Res> extends _$TimeCopyWithImpl<$Res, _$_Time>
    implements _$$_TimeCopyWith<$Res> {
  __$$_TimeCopyWithImpl(_$_Time _value, $Res Function(_$_Time) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? mins = null,
    Object? isAm = null,
    Object? is24hour = null,
  }) {
    return _then(_$_Time(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      mins: null == mins
          ? _value.mins
          : mins // ignore: cast_nullable_to_non_nullable
              as int,
      isAm: null == isAm
          ? _value.isAm
          : isAm // ignore: cast_nullable_to_non_nullable
              as bool,
      is24hour: null == is24hour
          ? _value.is24hour
          : is24hour // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Time implements _Time {
  const _$_Time(
      {required this.hour,
      required this.mins,
      this.isAm = false,
      this.is24hour = false});

  factory _$_Time.fromJson(Map<String, dynamic> json) => _$$_TimeFromJson(json);

  @override
  final int hour;
  @override
  final int mins;
  @override
  @JsonKey()
  final bool isAm;
  @override
  @JsonKey()
  final bool is24hour;

  @override
  String toString() {
    return 'Time(hour: $hour, mins: $mins, isAm: $isAm, is24hour: $is24hour)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Time &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.mins, mins) || other.mins == mins) &&
            (identical(other.isAm, isAm) || other.isAm == isAm) &&
            (identical(other.is24hour, is24hour) ||
                other.is24hour == is24hour));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hour, mins, isAm, is24hour);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimeCopyWith<_$_Time> get copyWith =>
      __$$_TimeCopyWithImpl<_$_Time>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeToJson(
      this,
    );
  }
}

abstract class _Time implements Time {
  const factory _Time(
      {required final int hour,
      required final int mins,
      final bool isAm,
      final bool is24hour}) = _$_Time;

  factory _Time.fromJson(Map<String, dynamic> json) = _$_Time.fromJson;

  @override
  int get hour;
  @override
  int get mins;
  @override
  bool get isAm;
  @override
  bool get is24hour;
  @override
  @JsonKey(ignore: true)
  _$$_TimeCopyWith<_$_Time> get copyWith => throw _privateConstructorUsedError;
}
