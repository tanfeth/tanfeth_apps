// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ParamBaseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamBaseModel _$ParamBaseModelFromJson(Map<String, dynamic> json) =>
    ParamBaseModel()
      ..pageNumber = json['pageNumber'] as String?
      ..pageSize = json['pageSize'] as String?
      ..name = json['name'] as String?
      ..orderBy = json['orderBy'] as String?;

Map<String, dynamic> _$ParamBaseModelToJson(ParamBaseModel instance) {
  final val = <String, dynamic>{
    'pageNumber': instance.pageNumber,
    'pageSize': instance.pageSize,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('orderBy', instance.orderBy);
  return val;
}
