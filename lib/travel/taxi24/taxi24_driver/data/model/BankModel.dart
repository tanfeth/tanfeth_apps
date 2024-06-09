

import 'package:json_annotation/json_annotation.dart';

part 'BankModel.g.dart';

@JsonSerializable(explicitToJson: true)
class BankModel {

   int? id;
   String? name;
   String? bank;
   String? iBan;


  BankModel();


  factory BankModel.fromJson(Map<String, dynamic> json) => _$BankModelFromJson(json);

  static List<BankModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(BankModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$BankModelToJson(this);
  
  
}