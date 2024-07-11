// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BodyUploadDriverAttachmentModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyUploadDriverAttachmentModel _$BodyUploadDriverAttachmentModelFromJson(
        Map<String, dynamic> json) =>
    BodyUploadDriverAttachmentModel()
      ..licenceExpiryDate = json['LicenceExpiryDate'] as String?
      ..saudiIdExpiryDate = json['SaudiIdExpiryDate'] as String?;

Map<String, dynamic> _$BodyUploadDriverAttachmentModelToJson(
        BodyUploadDriverAttachmentModel instance) =>
    <String, dynamic>{
      'LicenceExpiryDate': instance.licenceExpiryDate,
      'SaudiIdExpiryDate': instance.saudiIdExpiryDate,
    };
