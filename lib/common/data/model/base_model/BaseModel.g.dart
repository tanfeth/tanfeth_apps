// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BaseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) => BaseModel()
  ..id = (json['id'] as num).toInt()
  ..isAdded = json['isAdded'] as bool?
  ..createdBy = json['createdBy'] as String?
  ..createdAt = json['createdAt'] as String?
  ..lastModifiedBy = json['lastModifiedBy'] as String?
  ..lastModifiedAt = json['lastModifiedAt'] as String?;

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'id': instance.id,
      'isAdded': instance.isAdded,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
      'lastModifiedBy': instance.lastModifiedBy,
      'lastModifiedAt': instance.lastModifiedAt,
    };
