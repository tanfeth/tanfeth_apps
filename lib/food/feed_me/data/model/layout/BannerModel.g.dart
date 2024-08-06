// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BannerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => BannerModel()
  ..id = json['id'] as num?
  ..typeEnum = json['type_enum'] as String?
  ..type = json['type'] as String?
  ..image = json['image'] as String?
  ..link = json['link'] as String?;

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type_enum': instance.typeEnum,
      'type': instance.type,
      'image': instance.image,
      'link': instance.link,
    };
