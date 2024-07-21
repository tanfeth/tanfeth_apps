// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseDriverProfileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDriverProfileModel _$ResponseDriverProfileModelFromJson(
        Map<String, dynamic> json) =>
    ResponseDriverProfileModel()
      ..name = json['name'] as String?
      ..mobile = json['mobile'] as String?
      ..email = json['email'] as String?
      ..rate = (json['rate'] as num?)?.toInt()
      ..complationRate = (json['complationRate'] as num?)?.toInt()
      ..acceptanceRate = (json['acceptanceRate'] as num?)?.toInt()
      ..dateOfBirthHijri = json['dateOfBirthHijri'] as String?
      ..dateOfBirth = json['dateOfBirth'] as String?
      ..gender = (json['gender'] as num?)?.toInt()
      ..profileImage = json['profileImage'] as String?
      ..isProfileImageEditied = json['isProfileImageEditied'] as bool?
      ..profileImageEditedState = json['profileImageEditedState'] as String?
      ..profileImageEditedStateNote =
          json['profileImageEditedStateNote'] as String?;

Map<String, dynamic> _$ResponseDriverProfileModelToJson(
        ResponseDriverProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mobile': instance.mobile,
      'email': instance.email,
      'rate': instance.rate,
      'complationRate': instance.complationRate,
      'acceptanceRate': instance.acceptanceRate,
      'dateOfBirthHijri': instance.dateOfBirthHijri,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'profileImage': instance.profileImage,
      'isProfileImageEditied': instance.isProfileImageEditied,
      'profileImageEditedState': instance.profileImageEditedState,
      'profileImageEditedStateNote': instance.profileImageEditedStateNote,
    };
