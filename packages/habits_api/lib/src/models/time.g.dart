// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Time _$$_TimeFromJson(Map<String, dynamic> json) => _$_Time(
      hour: json['hour'] as int,
      mins: json['mins'] as int,
      isAm: json['isAm'] as bool? ?? false,
      is24hour: json['is24hour'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TimeToJson(_$_Time instance) => <String, dynamic>{
      'hour': instance.hour,
      'mins': instance.mins,
      'isAm': instance.isAm,
      'is24hour': instance.is24hour,
    };
