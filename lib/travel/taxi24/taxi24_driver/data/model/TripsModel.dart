


import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/TripModel.dart';


import 'package:json_annotation/json_annotation.dart';

part 'TripsModel.g.dart';

@JsonSerializable(explicitToJson: true)
class TripsModel {

   int? totalTrips ;
   int? completedTrips ;
   int? rejectedTrips ;
   int? cancelledTripFromUser ;
   int? passengerDidNotShow ;
   List<TripModel>? lastTrips ;
  
  
  TripsModel();


   factory TripsModel.fromJson(Map<String, dynamic> json) => _$TripsModelFromJson(json);

   static List<TripsModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(TripsModel.fromJson).toList();

   Map<String, dynamic> toJson() => _$TripsModelToJson(this);
   
   
  
}