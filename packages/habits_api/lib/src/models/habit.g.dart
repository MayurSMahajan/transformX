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
      stats: json['stats'] == null
          ? null
          : Stats.fromJson(json['stats'] as Map<String, dynamic>),
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
      'stats': instance.stats.toJson(),
    };
