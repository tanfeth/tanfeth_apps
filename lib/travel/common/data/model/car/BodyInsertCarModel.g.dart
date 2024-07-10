// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BodyInsertCarModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyInsertCarModel _$BodyInsertCarModelFromJson(Map<String, dynamic> json) =>
    BodyInsertCarModel()
      ..carTypeId = (json['CarTypeId'] as num?)?.toInt()
      ..carModelId = (json['CarModelId'] as num?)?.toInt()
      ..carYear = (json['CarYear'] as num?)?.toInt()
      ..plateType = (json['PlateType'] as num?)?.toInt()
      ..plateNumber = (json['PlateNumber'] as num?)?.toInt()
      ..plateLetterRight = (json['PlateLetterRight'] as num?)?.toInt()
      ..plateLetterMiddle = (json['PlateLetterMiddle'] as num?)?.toInt()
      ..plateLetterLeft = (json['PlateLetterLeft'] as num?)?.toInt();

Map<String, dynamic> _$BodyInsertCarModelToJson(BodyInsertCarModel instance) =>
    <String, dynamic>{
      'CarTypeId': instance.carTypeId,
      'CarModelId': instance.carModelId,
      'CarYear': instance.carYear,
      'PlateType': instance.plateType,
      'PlateNumber': instance.plateNumber,
      'PlateLetterRight': instance.plateLetterRight,
      'PlateLetterMiddle': instance.plateLetterMiddle,
      'PlateLetterLeft': instance.plateLetterLeft,
    };
