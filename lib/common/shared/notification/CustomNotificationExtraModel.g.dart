// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CustomNotificationExtraModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomNotificationExtraModel _$CustomNotificationExtraModelFromJson(
        Map<String, dynamic> json) =>
    CustomNotificationExtraModel()
      ..OpenType = json['OpenType'] as String?
      ..NotificationId = (json['NotificationId'] as num?)?.toInt()
      ..OpenValue = json['OpenValue'] as String?
      ..ImgUrl = json['ImgUrl'] as String?
      ..LogoUrl = json['LogoUrl'] as String?;

Map<String, dynamic> _$CustomNotificationExtraModelToJson(
        CustomNotificationExtraModel instance) =>
    <String, dynamic>{
      'OpenType': instance.OpenType,
      'NotificationId': instance.NotificationId,
      'OpenValue': instance.OpenValue,
      'ImgUrl': instance.ImgUrl,
      'LogoUrl': instance.LogoUrl,
    };
