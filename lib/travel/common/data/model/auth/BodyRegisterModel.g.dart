// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BodyRegisterModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyRegisterModel _$BodyRegisterModelFromJson(Map<String, dynamic> json) =>
    BodyRegisterModel()
      ..name = json['Name'] as String?
      ..identityNumber = json['IdentityNumber'] as String?
      ..phoneNumber = json['UserName'] as String?
      ..email = json['Email'] as String?
      ..dateOfBirth = json['DateOfBirth'] as String?
      ..gender = (json['Gender'] as num?)?.toInt()
      ..deviceToken = json['DeviceToken'] as String?
      ..city = (json['CityId'] as num?)?.toInt();

Map<String, dynamic> _$BodyRegisterModelToJson(BodyRegisterModel instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'IdentityNumber': instance.identityNumber,
      'UserName': instance.phoneNumber,
      'Email': instance.email,
      'DateOfBirth': instance.dateOfBirth,
      'Gender': instance.gender,
      'DeviceToken': instance.deviceToken,
      'CityId': instance.city,
    };
