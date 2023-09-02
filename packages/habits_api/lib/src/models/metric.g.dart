// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Metric _$$_MetricFromJson(Map<String, dynamic> json) => _$_Metric(
      title: json['title'] as String? ?? 'minutes',
      minimum: json['minimum'] as int? ?? 5,
      ideal: json['ideal'] as int? ?? 20,
    );

Map<String, dynamic> _$$_MetricToJson(_$_Metric instance) => <String, dynamic>{
      'title': instance.title,
      'minimum': instance.minimum,
      'ideal': instance.ideal,
    };
