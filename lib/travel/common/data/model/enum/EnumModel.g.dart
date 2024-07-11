// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EnumModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnumModel _$EnumModelFromJson(Map<String, dynamic> json) => EnumModel()
  ..id = (json['id'] as num?)?.toInt()
  ..name = json['name'] as String?
  ..code = json['code'] as String?;

Map<String, dynamic> _$EnumModelToJson(EnumModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  return val;
}
