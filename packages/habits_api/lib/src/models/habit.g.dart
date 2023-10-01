// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Habit _$HabitFromJson(Map<String, dynamic> json) => Habit(
      title: json['title'] as String,
      location: json['location'] as String,
      time: Time.fromJson(json['time'] as Map<String, dynamic>),
      metric: Metric.fromJson(json['metric'] as Map<String, dynamic>),
      ritual: json['ritual'] as String,
      shortReward: json['shortReward'] as String,
      longReward: json['longReward'] as String,
      streak: json['streak'] as int? ?? 0,
      record: json['record'] as int? ?? 0,
      id: json['id'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$HabitToJson(Habit instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'location': instance.location,
      'time': instance.time.toJson(),
      'metric': instance.metric.toJson(),
      'icon': instance.icon,
      'ritual': instance.ritual,
      'shortReward': instance.shortReward,
      'longReward': instance.longReward,
      'streak': instance.streak,
      'record': instance.record,
    };
