// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: non_constant_identifier_names

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Track _$$_TrackFromJson(Map<String, dynamic> json) => _$_Track(
      trackedUpdate: json['trackedUpdate'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
      didUseApp: json['didUseApp'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TrackToJson(_$_Track instance) => <String, dynamic>{
      'trackedUpdate': instance.trackedUpdate,
      'dateTime': instance.dateTime.toIso8601String(),
      'didUseApp': instance.didUseApp,
    };
