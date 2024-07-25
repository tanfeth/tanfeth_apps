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
    BodyUploadDriverAttachmentModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LicenceExpiryDate', instance.licenceExpiryDate);
  writeNotNull('SaudiIdExpiryDate', instance.saudiIdExpiryDate);
  return val;
}
