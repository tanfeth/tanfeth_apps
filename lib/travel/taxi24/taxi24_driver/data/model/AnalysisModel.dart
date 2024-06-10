

import 'package:json_annotation/json_annotation.dart';

part 'AnalysisModel.g.dart';

@JsonSerializable(explicitToJson: true)

class AnalysisModel {

   String? key;
   List<double>? value;
  
  AnalysisModel();

   factory AnalysisModel.fromJson(Map<String, dynamic> json) => _$AnalysisModelFromJson(json);

   static List<AnalysisModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(AnalysisModel.fromJson).toList();

   Map<String, dynamic> toJson() => _$AnalysisModelToJson(this);
   
   
  
}