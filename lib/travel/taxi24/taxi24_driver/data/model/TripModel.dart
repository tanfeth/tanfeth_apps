



import 'package:json_annotation/json_annotation.dart';

part 'TripModel.g.dart';

@JsonSerializable(explicitToJson: true)


class TripModel{

   int? orderId ;
   String? destinationName;
   double? totalPrice;
   String? tripStatus;
   String? creationDate;
  
  
  TripModel();

  factory TripModel.fromJson(Map<String, dynamic> json) => _$TripModelFromJson(json);

  static List<TripModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(TripModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$TripModelToJson(this);
  
}