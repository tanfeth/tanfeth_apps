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
      ..carEligibilty = json['carEligibilty'] as String?
      ..carId = (json['carId'] as num?)?.toInt()
      ..licenseImageState = json['licenseImageState'] as String?
      ..saudiIdImageState = json['saudiIdImageState'] as String?
      ..profileImageState = json['profileImageState'] as String?
      ..driverEligibilty = json['driverEligibilty'] as String?;

Map<String, dynamic> _$ResponseDriverStatusModelToJson(
        ResponseDriverStatusModel instance) =>
    <String, dynamic>{
      'carDetailsState': instance.carDetailsState,
      'carRegistrationState': instance.carRegistrationState,
      'carInssuranceState': instance.carInssuranceState,
      'carEligibilty': instance.carEligibilty,
      'carId': instance.carId,
      'licenseImageState': instance.licenseImageState,
      'saudiIdImageState': instance.saudiIdImageState,
      'profileImageState': instance.profileImageState,
      'driverEligibilty': instance.driverEligibilty,
    };
