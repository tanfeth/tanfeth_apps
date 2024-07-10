// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BodyUploadCarAttachmentModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyUploadCarAttachmentModel _$BodyUploadCarAttachmentModelFromJson(
        Map<String, dynamic> json) =>
    BodyUploadCarAttachmentModel()
      ..carId = (json['CarId'] as num?)?.toInt()
      ..carInsuranceExpiryDate = json['CarInsuranceExpiryDate'] as String?
      ..vehicalRegistrationExpiryDate =
          json['VehicalRegistrationExpiryDate'] as String?;

Map<String, dynamic> _$BodyUploadCarAttachmentModelToJson(
        BodyUploadCarAttachmentModel instance) =>
    <String, dynamic>{
      'CarId': instance.carId,
      'CarInsuranceExpiryDate': instance.carInsuranceExpiryDate,
      'VehicalRegistrationExpiryDate': instance.vehicalRegistrationExpiryDate,
    };
