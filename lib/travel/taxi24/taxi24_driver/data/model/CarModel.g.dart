// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CarModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarModel _$CarModelFromJson(Map<String, dynamic> json) => CarModel()
  ..id = (json['id'] as num).toInt()
  ..isAdded = json['isAdded'] as bool?
  ..createdBy = json['createdBy'] as String?
  ..createdAt = json['createdAt'] as String?
  ..lastModifiedBy = json['lastModifiedBy'] as String?
  ..lastModifiedAt = json['lastModifiedAt'] as String?
  ..carType = json['carType'] as String?
  ..carModel = json['carModel'] as String?
  ..carYear = (json['carYear'] as num?)?.toInt()
  ..carColor = json['carColor'] as String?
  ..carRegistration = json['carRegistration'] as String?
  ..carRegistrationExpiryDate = json['carRegistrationExpiryDate'] as String?
  ..carInsurance = json['carInsurance'] as String?
  ..carInsuranceExpiryDate = json['carInsuranceExpiryDate'] as String?
  ..plateNo = json['plateNo'] as String?
  ..driverId = (json['driverId'] as num?)?.toInt()
  ..carDetailsState = json['carDetailsState'] as String?
  ..carRegistrationState = json['carRegistrationState'] as String?
  ..carInsuranceState = json['carInsuranceState'] as String?
  ..isDefault = json['isDefault'] as bool?
  ..plateLetterRight = json['plateLetterRight'] as String?
  ..plateLetterMiddle = json['plateLetterMiddle'] as String?
  ..plateLetterLeft = json['plateLetterLeft'] as String?
  ..plateType = json['plateType'] as String?
  ..carSeatType = (json['carSeatType'] as num?)?.toInt()
  ..photos =
      (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$CarModelToJson(CarModel instance) => <String, dynamic>{
      'id': instance.id,
      'isAdded': instance.isAdded,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
      'lastModifiedBy': instance.lastModifiedBy,
      'lastModifiedAt': instance.lastModifiedAt,
      'carType': instance.carType,
      'carModel': instance.carModel,
      'carYear': instance.carYear,
      'carColor': instance.carColor,
      'carRegistration': instance.carRegistration,
      'carRegistrationExpiryDate': instance.carRegistrationExpiryDate,
      'carInsurance': instance.carInsurance,
      'carInsuranceExpiryDate': instance.carInsuranceExpiryDate,
      'plateNo': instance.plateNo,
      'driverId': instance.driverId,
      'carDetailsState': instance.carDetailsState,
      'carRegistrationState': instance.carRegistrationState,
      'carInsuranceState': instance.carInsuranceState,
      'isDefault': instance.isDefault,
      'plateLetterRight': instance.plateLetterRight,
      'plateLetterMiddle': instance.plateLetterMiddle,
      'plateLetterLeft': instance.plateLetterLeft,
      'plateType': instance.plateType,
      'carSeatType': instance.carSeatType,
      'photos': instance.photos,
    };
