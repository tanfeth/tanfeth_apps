



import 'package:json_annotation/json_annotation.dart';

part 'ResponseDriverProfileModel.g.dart';

@JsonSerializable(explicitToJson: true)

class ResponseDriverProfileModel {

  String? name;
  String? mobile;
  String? email;
  int? rate;
  int? complationRate;
  int? acceptanceRate;
  String? dateOfBirthHijri;
  String? dateOfBirth;
  int? gender;
  String? profileImage;



  ResponseDriverProfileModel();

  factory ResponseDriverProfileModel.fromJson(Map<String, dynamic> json) => _$ResponseDriverProfileModelFromJson(json);

  static List<ResponseDriverProfileModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(ResponseDriverProfileModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$ResponseDriverProfileModelToJson(this);



}


