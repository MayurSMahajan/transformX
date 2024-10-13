// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Metric _$MetricFromJson(Map<String, dynamic> json) {
  return _Metric.fromJson(json);
}

/// @nodoc
mixin _$Metric {
  String get title => throw _privateConstructorUsedError;
  int get minimum => throw _privateConstructorUsedError;
  int get ideal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetricCopyWith<Metric> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetricCopyWith<$Res> {
  factory $MetricCopyWith(Metric value, $Res Function(Metric) then) =
      _$MetricCopyWithImpl<$Res, Metric>;
  @useResult
  $Res call({String title, int minimum, int ideal});
}

/// @nodoc
class _$MetricCopyWithImpl<$Res, $Val extends Metric>
    implements $MetricCopyWith<$Res> {
  _$MetricCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? minimum = null,
    Object? ideal = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      minimum: null == minimum
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as int,
      ideal: null == ideal
          ? _value.ideal
          : ideal // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MetricCopyWith<$Res> implements $MetricCopyWith<$Res> {
  factory _$$_MetricCopyWith(_$_Metric value, $Res Function(_$_Metric) then) =
      __$$_MetricCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, int minimum, int ideal});
}

/// @nodoc
class __$$_MetricCopyWithImpl<$Res>
    extends _$MetricCopyWithImpl<$Res, _$_Metric>
    implements _$$_MetricCopyWith<$Res> {
  __$$_MetricCopyWithImpl(_$_Metric _value, $Res Function(_$_Metric) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? minimum = null,
    Object? ideal = null,
  }) {
    return _then(_$_Metric(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      minimum: null == minimum
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as int,
      ideal: null == ideal
          ? _value.ideal
          : ideal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Metric implements _Metric {
  const _$_Metric({this.title = 'minutes', this.minimum = 5, this.ideal = 20});

  factory _$_Metric.fromJson(Map<String, dynamic> json) =>
      _$$_MetricFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final int minimum;
  @override
  @JsonKey()
  final int ideal;

  @override
  String toString() {
    return 'Metric(title: $title, minimum: $minimum, ideal: $ideal)';
  }

  @override
  // ignore: non_nullable_equals_parameter
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Metric &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.minimum, minimum) || other.minimum == minimum) &&
            (identical(other.ideal, ideal) || other.ideal == ideal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, minimum, ideal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MetricCopyWith<_$_Metric> get copyWith =>
      __$$_MetricCopyWithImpl<_$_Metric>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MetricToJson(
      this,
    );
  }
}

abstract class _Metric implements Metric {
  const factory _Metric(
      {final String title, final int minimum, final int ideal}) = _$_Metric;

  factory _Metric.fromJson(Map<String, dynamic> json) = _$_Metric.fromJson;

  @override
  String get title;
  @override
  int get minimum;
  @override
  int get ideal;
  @override
  @JsonKey(ignore: true)
  _$$_MetricCopyWith<_$_Metric> get copyWith =>
      throw _privateConstructorUsedError;
}
