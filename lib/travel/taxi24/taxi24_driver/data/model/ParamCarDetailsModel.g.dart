// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ParamCarDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamCarDetailsModel _$ParamCarDetailsModelFromJson(
        Map<String, dynamic> json) =>
    ParamCarDetailsModel(
      carType: json['carType'] as String?,
      carModel: json['carModel'] as String?,
      carYearModel: json['carYearModel'] as String?,
      carSeatType: json['carSeatType'] as String?,
      isDisable: json['isDisable'] as bool?,
      plateNumber: json['plateNumber'] as String?,
      plateLetterRight: json['plateLetterRight'] as String?,
      plateLetterMiddle: json['plateLetterMiddle'] as String?,
      plateLetterLeft: json['plateLetterLeft'] as String?,
      sequenceNumber: json['sequenceNumber'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$ParamCarDetailsModelToJson(
        ParamCarDetailsModel instance) =>
    <String, dynamic>{
      'carType': instance.carType,
      'carModel': instance.carModel,
      'carYearModel': instance.carYearModel,
      'carSeatType': instance.carSeatType,
      'isDisable': instance.isDisable,
      'plateNumber': instance.plateNumber,
      'plateLetterRight': instance.plateLetterRight,
      'plateLetterMiddle': instance.plateLetterMiddle,
      'plateLetterLeft': instance.plateLetterLeft,
      'sequenceNumber': instance.sequenceNumber,
      'color': instance.color,
    };
