// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DriverModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverModel _$DriverModelFromJson(Map<String, dynamic> json) => DriverModel()
  ..driverId = (json['driverId'] as num?)?.toInt()
  ..userName = json['userName'] as String?
  ..name = json['name'] as String?
  ..email = json['email'] as String?
  ..profileImage = json['profileImage'] as String?
  ..userToken = json['userToken'] as String?
  ..completionRate = (json['completionRate'] as num?)?.toInt()
  ..acceptanceRate = (json['acceptanceRate'] as num?)?.toInt()
  ..dateOfBirth = json['dateOfBirth'] as String?
  ..code = json['code'] as String?
  ..gender = (json['gender'] as num?)?.toInt()
  ..rate = (json['rate'] as num?)?.toDouble()
  ..wallet = (json['wallet'] as num?)?.toDouble()
  ..isEmailVerified = json['isEmailVerified'] as bool?
  ..carSeatType = (json['carSeatType'] as num?)?.toInt()
  ..licenseImage = json['licenseImage'] as String?
  ..licenseImageExpiryDate = json['licenseImageExpiryDate'] as String?
  ..saudiIdImage = json['saudiIdImage'] as String?
  ..saudiIdImageExpiryDate = json['saudiIdImageExpiryDate'] as String?
  ..licenseImageState = json['licenseImageState'] as String?
  ..saudiIdImageState = json['saudiIdImageState'] as String?
  ..profileImageState = json['profileImageState'] as String?
  ..carDetailsState = json['carDetailsState'] as String?
  ..carRegistrationState = json['carRegistrationState'] as String?
  ..carInsuranceState = json['carInsuranceState'] as String?
  ..driverEligibility = json['driverEligibility'] as String?
  ..carEligibility = json['carEligibility'] as String?
  ..eligibility = json['eligibility'] as String?
  ..car = json['car'] == null
      ? null
      : CarModel.fromJson(json['car'] as Map<String, dynamic>)
  ..driverNumber = json['driverNumber'] as String?
  ..onlyCredit = json['onlyCredit'] as bool?
  ..cancelOrderCount = (json['cancelOrderCount'] as num?)?.toInt();

Map<String, dynamic> _$DriverModelToJson(DriverModel instance) =>
    <String, dynamic>{
      'driverId': instance.driverId,
      'userName': instance.userName,
      'name': instance.name,
      'email': instance.email,
      'profileImage': instance.profileImage,
      'userToken': instance.userToken,
      'completionRate': instance.completionRate,
      'acceptanceRate': instance.acceptanceRate,
      'dateOfBirth': instance.dateOfBirth,
      'code': instance.code,
      'gender': instance.gender,
      'rate': instance.rate,
      'wallet': instance.wallet,
      'isEmailVerified': instance.isEmailVerified,
      'carSeatType': instance.carSeatType,
      'licenseImage': instance.licenseImage,
      'licenseImageExpiryDate': instance.licenseImageExpiryDate,
      'saudiIdImage': instance.saudiIdImage,
      'saudiIdImageExpiryDate': instance.saudiIdImageExpiryDate,
      'licenseImageState': instance.licenseImageState,
      'saudiIdImageState': instance.saudiIdImageState,
      'profileImageState': instance.profileImageState,
      'carDetailsState': instance.carDetailsState,
      'carRegistrationState': instance.carRegistrationState,
      'carInsuranceState': instance.carInsuranceState,
      'driverEligibility': instance.driverEligibility,
      'carEligibility': instance.carEligibility,
      'eligibility': instance.eligibility,
      'car': instance.car?.toJson(),
      'driverNumber': instance.driverNumber,
      'onlyCredit': instance.onlyCredit,
      'cancelOrderCount': instance.cancelOrderCount,
    };
