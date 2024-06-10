


import 'package:json_annotation/json_annotation.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/CarModel.dart';

part 'DriverModel.g.dart';

@JsonSerializable(explicitToJson: true)


class DriverModel {

   int ?driverId;
   String ?userName;
   String ?name;
   String ?email;
   String ?profileImage;
   String ?userToken;
   int ?completionRate;
   int? acceptanceRate;
   String ?dateOfBirth;
   String ?code;
   int ?gender;
   double? rate;
   double? wallet;
   bool ?isEmailVerified;
   int ?carSeatType;
   String? licenseImage;
   String? licenseImageExpiryDate;
   String? saudiIdImage;
   String? saudiIdImageExpiryDate;
   String? licenseImageState;
   String ?saudiIdImageState;
   String ?profileImageState;
   String ?carDetailsState;
   String ?carRegistrationState;
   String ?carInsuranceState;
   String ?driverEligibility;
   String ?carEligibility;
   String ?eligibility;
   CarModel ? car;
   String ? driverNumber;
   bool ? onlyCredit;
   int ? cancelOrderCount;
  
  
  DriverModel();

  factory DriverModel.fromJson(Map<String, dynamic> json) => _$DriverModelFromJson(json);

  static List<DriverModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(DriverModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$DriverModelToJson(this);
}