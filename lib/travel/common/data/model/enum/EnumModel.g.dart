// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EnumModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnumModel _$EnumModelFromJson(Map<String, dynamic> json) => EnumModel()
  ..id = (json['id'] as num?)?.toInt()
  ..name = json['name'] as String?
  ..code = json['code'] as String?;

Map<String, dynamic> _$EnumModelToJson(EnumModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
