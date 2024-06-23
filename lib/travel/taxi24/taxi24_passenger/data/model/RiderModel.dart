

import 'package:json_annotation/json_annotation.dart';

part 'RiderModel.g.dart';

@JsonSerializable(explicitToJson: true)

class RiderModel{

   int? id;
   String? name;
   String? mobileNumber;
  
  RiderModel();


   factory RiderModel.fromJson(Map<String, dynamic> json) => _$RiderModelFromJson(json);

   static List<RiderModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(RiderModel.fromJson).toList();

   Map<String, dynamic> toJson() => _$RiderModelToJson(this);
}