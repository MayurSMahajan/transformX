// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return _Stats.fromJson(json);
}

/// @nodoc
mixin _$Stats {
  int get streak => throw _privateConstructorUsedError;
  int get monthlyRecord => throw _privateConstructorUsedError;
  int get weeklyRecord => throw _privateConstructorUsedError;
  int get yearlyRecord => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsCopyWith<Stats> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsCopyWith<$Res> {
  factory $StatsCopyWith(Stats value, $Res Function(Stats) then) =
      _$StatsCopyWithImpl<$Res, Stats>;
  @useResult
  $Res call(
      {int streak, int monthlyRecord, int weeklyRecord, int yearlyRecord});
}

/// @nodoc
class _$StatsCopyWithImpl<$Res, $Val extends Stats>
    implements $StatsCopyWith<$Res> {
  _$StatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streak = null,
    Object? monthlyRecord = null,
    Object? weeklyRecord = null,
    Object? yearlyRecord = null,
  }) {
    return _then(_value.copyWith(
      streak: null == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyRecord: null == monthlyRecord
          ? _value.monthlyRecord
          : monthlyRecord // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyRecord: null == weeklyRecord
          ? _value.weeklyRecord
          : weeklyRecord // ignore: cast_nullable_to_non_nullable
              as int,
      yearlyRecord: null == yearlyRecord
          ? _value.yearlyRecord
          : yearlyRecord // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatsCopyWith<$Res> implements $StatsCopyWith<$Res> {
  factory _$$_StatsCopyWith(_$_Stats value, $Res Function(_$_Stats) then) =
      __$$_StatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int streak, int monthlyRecord, int weeklyRecord, int yearlyRecord});
}

/// @nodoc
class __$$_StatsCopyWithImpl<$Res> extends _$StatsCopyWithImpl<$Res, _$_Stats>
    implements _$$_StatsCopyWith<$Res> {
  __$$_StatsCopyWithImpl(_$_Stats _value, $Res Function(_$_Stats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streak = null,
    Object? monthlyRecord = null,
    Object? weeklyRecord = null,
    Object? yearlyRecord = null,
  }) {
    return _then(_$_Stats(
      streak: null == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyRecord: null == monthlyRecord
          ? _value.monthlyRecord
          : monthlyRecord // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyRecord: null == weeklyRecord
          ? _value.weeklyRecord
          : weeklyRecord // ignore: cast_nullable_to_non_nullable
              as int,
      yearlyRecord: null == yearlyRecord
          ? _value.yearlyRecord
          : yearlyRecord // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stats implements _Stats {
  const _$_Stats(
      {this.streak = 0,
      this.monthlyRecord = 0,
      this.weeklyRecord = 0,
      this.yearlyRecord = 0});

  factory _$_Stats.fromJson(Map<String, dynamic> json) =>
      _$$_StatsFromJson(json);

  @override
  @JsonKey()
  final int streak;
  @override
  @JsonKey()
  final int monthlyRecord;
  @override
  @JsonKey()
  final int weeklyRecord;
  @override
  @JsonKey()
  final int yearlyRecord;

  @override
  String toString() {
    return 'Stats(streak: $streak, monthlyRecord: $monthlyRecord, weeklyRecord: $weeklyRecord, yearlyRecord: $yearlyRecord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Stats &&
            (identical(other.streak, streak) || other.streak == streak) &&
            (identical(other.monthlyRecord, monthlyRecord) ||
                other.monthlyRecord == monthlyRecord) &&
            (identical(other.weeklyRecord, weeklyRecord) ||
                other.weeklyRecord == weeklyRecord) &&
            (identical(other.yearlyRecord, yearlyRecord) ||
                other.yearlyRecord == yearlyRecord));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, streak, monthlyRecord, weeklyRecord, yearlyRecord);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatsCopyWith<_$_Stats> get copyWith =>
      __$$_StatsCopyWithImpl<_$_Stats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatsToJson(
      this,
    );
  }
}

abstract class _Stats implements Stats {
  const factory _Stats(
      {final int streak,
      final int monthlyRecord,
      final int weeklyRecord,
      final int yearlyRecord}) = _$_Stats;

  factory _Stats.fromJson(Map<String, dynamic> json) = _$_Stats.fromJson;

  @override
  int get streak;
  @override
  int get monthlyRecord;
  @override
  int get weeklyRecord;
  @override
  int get yearlyRecord;
  @override
  @JsonKey(ignore: true)
  _$$_StatsCopyWith<_$_Stats> get copyWith =>
      throw _privateConstructorUsedError;
}
