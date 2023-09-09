// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Track _$$_TrackFromJson(Map<String, dynamic> json) => _$_Track(
      id: json['id'] as String,
      trackedUpdate: json['trackedUpdate'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
      didUseApp: json['didUseApp'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TrackToJson(_$_Track instance) => <String, dynamic>{
      'id': instance.id,
      'trackedUpdate': instance.trackedUpdate,
      'dateTime': instance.dateTime.toIso8601String(),
      'didUseApp': instance.didUseApp,
    };
