


import 'package:json_annotation/json_annotation.dart';

part 'ResponseDriverStatusModel.g.dart';

@JsonSerializable(explicitToJson: true)

class ResponseDriverStatusModel {

  String? carDetailsState;
  String? carRegistrationState;
  String? carInssuranceState;
  String? carRegistrationStateNote;
  String? carInssuranceStateNote;
  String? carEligibilty;
  int? carId;
  String? licenseImageState;
  String? saudiIdImageState;
  String? profileImageState;
  String? driverEligibilty;
  String? licenseImageStateNote;
  String? saudiIdImageStateNote;
  String? profileImageStateNote;


  ResponseDriverStatusModel();

  factory ResponseDriverStatusModel.fromJson(Map<String, dynamic> json) => _$ResponseDriverStatusModelFromJson(json);

  static List<ResponseDriverStatusModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(ResponseDriverStatusModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$ResponseDriverStatusModelToJson(this);



}


