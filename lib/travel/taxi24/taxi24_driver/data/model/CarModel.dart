
import 'package:json_annotation/json_annotation.dart';
import 'package:tanfeth_apps/common/data/model/base_model/BaseModel.dart';

part 'CarModel.g.dart';

@JsonSerializable(explicitToJson: true)

class CarModel extends BaseModel {
   String? carType;
   String? carModel;
   int? carYear;
   String? carColor;
   String? carRegistration;
   String? carRegistrationExpiryDate;
   String? carInsurance;
   String? carInsuranceExpiryDate;
   String? plateNo;
   int? driverId;
   String? carDetailsState;
   String? carRegistrationState;
   String? carInsuranceState;
   bool? isDefault;
   String? plateLetterRight;
   String? plateLetterMiddle;
   String? plateLetterLeft;
   String? plateType;
   int? carSeatType;
   List<String>?photos;
   
  CarModel();

  factory CarModel.fromJson(Map<String, dynamic> json) => _$CarModelFromJson(json);

  static List<CarModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(CarModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$CarModelToJson(this);
  
  
  
}