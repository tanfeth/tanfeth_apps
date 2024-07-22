// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseDriverStatusModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDriverStatusModel _$ResponseDriverStatusModelFromJson(
        Map<String, dynamic> json) =>
    ResponseDriverStatusModel()
      ..carDetailsState = json['carDetailsState'] as String?
      ..carRegistrationState = json['carRegistrationState'] as String?
      ..carInssuranceState = json['carInssuranceState'] as String?
      ..carRegistrationStateNote = json['carRegistrationStateNote'] as String?
      ..carInssuranceStateNote = json['carInssuranceStateNote'] as String?
      ..carEligibilty = json['carEligibilty'] as String?
      ..carId = (json['carId'] as num?)?.toInt()
      ..licenseImageState = json['licenseImageState'] as String?
      ..saudiIdImageState = json['saudiIdImageState'] as String?
      ..profileImageState = json['profileImageState'] as String?
      ..driverEligibilty = json['driverEligibilty'] as String?
      ..licenseImageStateNote = json['licenseImageStateNote'] as String?
      ..saudiIdImageStateNote = json['saudiIdImageStateNote'] as String?
      ..profileImageStateNote = json['profileImageStateNote'] as String?;

Map<String, dynamic> _$ResponseDriverStatusModelToJson(
        ResponseDriverStatusModel instance) =>
    <String, dynamic>{
      'carDetailsState': instance.carDetailsState,
      'carRegistrationState': instance.carRegistrationState,
      'carInssuranceState': instance.carInssuranceState,
      'carRegistrationStateNote': instance.carRegistrationStateNote,
      'carInssuranceStateNote': instance.carInssuranceStateNote,
      'carEligibilty': instance.carEligibilty,
      'carId': instance.carId,
      'licenseImageState': instance.licenseImageState,
      'saudiIdImageState': instance.saudiIdImageState,
      'profileImageState': instance.profileImageState,
      'driverEligibilty': instance.driverEligibilty,
      'licenseImageStateNote': instance.licenseImageStateNote,
      'saudiIdImageStateNote': instance.saudiIdImageStateNote,
      'profileImageStateNote': instance.profileImageStateNote,
    };
