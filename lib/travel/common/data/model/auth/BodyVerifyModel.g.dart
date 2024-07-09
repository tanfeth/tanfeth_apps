// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BodyVerifyModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyVerifyModel _$BodyVerifyModelFromJson(Map<String, dynamic> json) =>
    BodyVerifyModel()
      ..phoneNumber = json['PhoneNumber'] as String?
      ..code = json['Code'] as String?
      ..appEnum = json['AppEnum'] as String?;

Map<String, dynamic> _$BodyVerifyModelToJson(BodyVerifyModel instance) =>
    <String, dynamic>{
      'PhoneNumber': instance.phoneNumber,
      'Code': instance.code,
      'AppEnum': instance.appEnum,
    };
