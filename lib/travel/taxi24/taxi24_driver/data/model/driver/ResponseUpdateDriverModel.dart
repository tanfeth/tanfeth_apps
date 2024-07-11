


import 'package:json_annotation/json_annotation.dart';

part 'ResponseUpdateDriverModel.g.dart';

@JsonSerializable(explicitToJson: true)

class ResponseUpdateDriverModel {

  String? name;
  String? email;
  String? dateOfBirth;
  int? gender;

  ResponseUpdateDriverModel();

  factory ResponseUpdateDriverModel.fromJson(Map<String, dynamic> json) => _$ResponseUpdateDriverModelFromJson(json);

  static List<ResponseUpdateDriverModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(ResponseUpdateDriverModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$ResponseUpdateDriverModelToJson(this);



}



