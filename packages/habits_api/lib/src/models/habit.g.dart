// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Habit _$HabitFromJson(Map<String, dynamic> json) => Habit(
      title: json['title'] as String,
      hour: json['hour'] as int,
      mins: json['mins'] as int,
      location: json['location'] as String,
      id: json['id'] as String?,
      icon: json['icon'] as String?,
      isAm: json['isAm'] as bool? ?? false,
    );

Map<String, dynamic> _$HabitToJson(Habit instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'hour': instance.hour,
      'mins': instance.mins,
      'isAm': instance.isAm,
      'location': instance.location,
      'icon': instance.icon,
    };
