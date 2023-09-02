// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stats _$$_StatsFromJson(Map<String, dynamic> json) => _$_Stats(
      streak: json['streak'] as int? ?? 0,
      monthlyRecord: json['monthlyRecord'] as int? ?? 0,
      weeklyRecord: json['weeklyRecord'] as int? ?? 0,
      yearlyRecord: json['yearlyRecord'] as int? ?? 0,
    );

Map<String, dynamic> _$$_StatsToJson(_$_Stats instance) => <String, dynamic>{
      'streak': instance.streak,
      'monthlyRecord': instance.monthlyRecord,
      'weeklyRecord': instance.weeklyRecord,
      'yearlyRecord': instance.yearlyRecord,
    };
