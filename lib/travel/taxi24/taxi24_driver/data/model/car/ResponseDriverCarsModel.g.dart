// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseDriverCarsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDriverCarsModel _$ResponseDriverCarsModelFromJson(
        Map<String, dynamic> json) =>
    ResponseDriverCarsModel()
      ..carModel = json['carModel'] as String?
      ..carType = json['carType'] as String?
      ..plate = json['plate'] as String?
      ..carCollor = json['carCollor'] as String?
      ..year = (json['year'] as num?)?.toInt();

Map<String, dynamic> _$ResponseDriverCarsModelToJson(
        ResponseDriverCarsModel instance) =>
    <String, dynamic>{
      'carModel': instance.carModel,
      'carType': instance.carType,
      'plate': instance.plate,
      'carCollor': instance.carCollor,
      'year': instance.year,
    };
