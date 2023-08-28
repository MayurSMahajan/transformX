// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stats _$$_StatsFromJson(Map<String, dynamic> json) => _$_Stats(
      id: json['id'] as String,
      streak: json['streak'] as int,
      monthlyRecord: json['monthlyRecord'] as int,
      weeklyRecord: json['weeklyRecord'] as int,
      yearlyRecord: json['yearlyRecord'] as int,
    );

Map<String, dynamic> _$$_StatsToJson(_$_Stats instance) => <String, dynamic>{
      'id': instance.id,
      'streak': instance.streak,
      'monthlyRecord': instance.monthlyRecord,
      'weeklyRecord': instance.weeklyRecord,
      'yearlyRecord': instance.yearlyRecord,
    };
