// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseVerifyModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseVerifyModel _$ResponseVerifyModelFromJson(Map<String, dynamic> json) =>
    ResponseVerifyModel()
      ..token = json['token'] as String?
      ..accountState = json['accountState'] as String?
      ..isInTrip = json['isInTrip'] as bool?;

Map<String, dynamic> _$ResponseVerifyModelToJson(
        ResponseVerifyModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'accountState': instance.accountState,
      'isInTrip': instance.isInTrip,
    };
