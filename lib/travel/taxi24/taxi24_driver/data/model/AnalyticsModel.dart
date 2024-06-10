
import 'package:json_annotation/json_annotation.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/AnalysisModel.dart';

part 'AnalyticsModel.g.dart';

@JsonSerializable(explicitToJson: true)

class AnalyticsModel {

   List<AnalysisModel>? analysis;
   String? duration;
   dynamic trips;
   dynamic netEarnings;
   dynamic tip;
   dynamic cancelTripFees;
   dynamic totalEarnings;

  AnalyticsModel();


  factory AnalyticsModel.fromJson(Map<String, dynamic> json) => _$AnalyticsModelFromJson(json);

  static List<AnalyticsModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(AnalyticsModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$AnalyticsModelToJson(this);
  
  
  
  
}