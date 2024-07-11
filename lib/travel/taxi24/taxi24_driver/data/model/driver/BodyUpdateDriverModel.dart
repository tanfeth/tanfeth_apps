



import 'package:json_annotation/json_annotation.dart';

part 'BodyUpdateDriverModel.g.dart';

@JsonSerializable(explicitToJson: true)

class BodyUpdateDriverModel {

  String? name;
  String? email;
  String? dateOfBirth;
  int? gender;
  
  BodyUpdateDriverModel();

  factory BodyUpdateDriverModel.fromJson(Map<String, dynamic> json) => _$BodyUpdateDriverModelFromJson(json);

  static List<BodyUpdateDriverModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(BodyUpdateDriverModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$BodyUpdateDriverModelToJson(this);



}



