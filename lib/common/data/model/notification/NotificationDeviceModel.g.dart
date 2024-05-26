// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationDeviceModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDeviceModel _$NotificationDeviceModelFromJson(
        Map<String, dynamic> json) =>
    NotificationDeviceModel()
      ..id = (json['id'] as num).toInt()
      ..isAdded = json['isAdded'] as bool?
      ..createdBy = json['createdBy'] as String?
      ..createdAt = json['createdAt'] as String?
      ..lastModifiedBy = json['lastModifiedBy'] as String?
      ..lastModifiedAt = json['lastModifiedAt'] as String?
      ..notificationToken = json['notificationToken'] as String?
      ..deviceType = json['deviceType'] as String?
      ..appVersion = json['appVersion'] as String?
      ..deviceVersion = json['deviceVersion'] as String?
      ..deviceModel = json['deviceModel'] as String?;

Map<String, dynamic> _$NotificationDeviceModelToJson(
        NotificationDeviceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isAdded': instance.isAdded,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
      'lastModifiedBy': instance.lastModifiedBy,
      'lastModifiedAt': instance.lastModifiedAt,
      'notificationToken': instance.notificationToken,
      'deviceType': instance.deviceType,
      'appVersion': instance.appVersion,
      'deviceVersion': instance.deviceVersion,
      'deviceModel': instance.deviceModel,
    };
