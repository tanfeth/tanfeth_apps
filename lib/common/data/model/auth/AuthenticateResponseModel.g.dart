// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthenticateResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateResponseModel _$AuthenticateResponseModelFromJson(
        Map<String, dynamic> json) =>
    AuthenticateResponseModel()
      ..name = json['name'] as String?
      ..userName = json['userName'] as String?
      ..emailAddress = json['emailAddress'] as String?
      ..phoneNumber = json['phoneNumber'] as String?
      ..imageUrl = json['imageUrl'] as String?
      ..fk_Account = (json['fk_Account'] as num?)?.toInt()
      ..fk_AccountState = (json['fk_AccountState'] as num?)?.toInt()
      ..fk_AccountType = (json['fk_AccountType'] as num?)?.toInt()
      ..isAdmin = json['isAdmin'] as bool?
      ..haveDoctorSubscription = json['haveDoctorSubscription'] as bool?;

Map<String, dynamic> _$AuthenticateResponseModelToJson(
        AuthenticateResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'userName': instance.userName,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'imageUrl': instance.imageUrl,
      'fk_Account': instance.fk_Account,
      'fk_AccountState': instance.fk_AccountState,
      'fk_AccountType': instance.fk_AccountType,
      'isAdmin': instance.isAdmin,
      'haveDoctorSubscription': instance.haveDoctorSubscription,
    };
