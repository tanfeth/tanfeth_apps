// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseUpdateDriverModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseUpdateDriverModel _$ResponseUpdateDriverModelFromJson(
        Map<String, dynamic> json) =>
    ResponseUpdateDriverModel()
      ..name = json['name'] as String?
      ..email = json['email'] as String?
      ..dateOfBirth = json['dateOfBirth'] as String?
      ..gender = (json['gender'] as num?)?.toInt();

Map<String, dynamic> _$ResponseUpdateDriverModelToJson(
        ResponseUpdateDriverModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
    };
