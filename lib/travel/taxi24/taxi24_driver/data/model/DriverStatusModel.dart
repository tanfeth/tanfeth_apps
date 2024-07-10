
import 'package:json_annotation/json_annotation.dart';
part 'DriverStatusModel.g.dart';


@JsonSerializable(explicitToJson: true)
class DriverStatusModel{


  String ? carDetailsState;

  String ? carRegistrationState;

  String ? carInssuranceState;

  String ? carEligibilty;

  int ? carId;

  String ? licenseImageState;

  String ? saudiIdImageState;

  String ? profileImageState;

  String ? driverEligibilty;



  DriverStatusModel();

  factory DriverStatusModel.fromJson(Map<String, dynamic> json) => _$DriverStatusModelFromJson(json);

  static List<DriverStatusModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(DriverStatusModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$DriverStatusModelToJson(this);

}
