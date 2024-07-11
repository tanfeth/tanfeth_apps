// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BodyUpdateDriverModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyUpdateDriverModel _$BodyUpdateDriverModelFromJson(
        Map<String, dynamic> json) =>
    BodyUpdateDriverModel()
      ..name = json['name'] as String?
      ..email = json['email'] as String?
      ..dateOfBirth = json['dateOfBirth'] as String?
      ..gender = (json['gender'] as num?)?.toInt();

Map<String, dynamic> _$BodyUpdateDriverModelToJson(
        BodyUpdateDriverModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
    };
