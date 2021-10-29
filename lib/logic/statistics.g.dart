// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Statistics _$StatisticsFromJson(Map<String, dynamic> json) {
  return Statistics()
    ..times = (json['times'] as List)
        ?.map((e) => e == null ? null : Duration(microseconds: e as int))
        ?.toList()
    ..errors = json['errors'] as int
    ..startTime = json['startTime'] == null
        ? null
        : DateTime.parse(json['startTime'] as String)
    ..options = (json['options'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    );
}

Map<String, dynamic> _$StatisticsToJson(Statistics instance) =>
    <String, dynamic>{
      'times': instance.times?.map((e) => e?.inMicroseconds)?.toList(),
      'errors': instance.errors,
      'startTime': instance.startTime?.toIso8601String(),
      'options': instance.options,
    };
