
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'LocationModel.g.dart';

@JsonSerializable(explicitToJson: true)
class LocationModel {
   String? placeId;
   String? description;
   String? locationCity;
   bool? isFavorite;
   LatLng? latLng;
  

  LocationModel();


   factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

   static List<LocationModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(LocationModel.fromJson).toList();

   Map<String, dynamic> toJson() => _$LocationModelToJson(this);


   
}
