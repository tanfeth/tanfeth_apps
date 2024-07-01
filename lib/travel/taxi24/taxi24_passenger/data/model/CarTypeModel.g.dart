// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CarTypeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarTypeModel _$CarTypeModelFromJson(Map<String, dynamic> json) => CarTypeModel()
  ..carType = json['carType'] as String?
  ..carImage = json['carImage'] as String?
  ..passengersNumber = (json['passengersNumber'] as num?)?.toInt()
  ..tripCost = (json['tripCost'] as num?)?.toDouble();

Map<String, dynamic> _$CarTypeModelToJson(CarTypeModel instance) =>
    <String, dynamic>{
      'carType': instance.carType,
      'carImage': instance.carImage,
      'passengersNumber': instance.passengersNumber,
      'tripCost': instance.tripCost,
    };
