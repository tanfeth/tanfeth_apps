// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RiderModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiderModel _$RiderModelFromJson(Map<String, dynamic> json) => RiderModel()
  ..id = (json['id'] as num?)?.toInt()
  ..name = json['name'] as String?
  ..mobileNumber = json['mobileNumber'] as String?;

Map<String, dynamic> _$RiderModelToJson(RiderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mobileNumber': instance.mobileNumber,
    };
