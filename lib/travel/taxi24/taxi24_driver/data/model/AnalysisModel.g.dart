// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnalysisModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalysisModel _$AnalysisModelFromJson(Map<String, dynamic> json) =>
    AnalysisModel()
      ..key = json['key'] as String?
      ..value = (json['value'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList();

Map<String, dynamic> _$AnalysisModelToJson(AnalysisModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };
