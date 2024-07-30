// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ParamCarModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamCarModel _$ParamCarModelFromJson(Map<String, dynamic> json) =>
    ParamCarModel()
      ..pageNumber = json['pageNumber'] as String?
      ..pageSize = json['pageSize'] as String?
      ..name = json['name'] as String?
      ..orderBy = json['orderBy'] as String?
      ..carTypeCode = json['carTypeCode'] as String?;

Map<String, dynamic> _$ParamCarModelToJson(ParamCarModel instance) {
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
  val['carTypeCode'] = instance.carTypeCode;
  return val;
}
