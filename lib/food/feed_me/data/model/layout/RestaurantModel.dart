
import 'package:json_annotation/json_annotation.dart';

part 'RestaurantModel.g.dart';

@JsonSerializable(explicitToJson: true)


class RestaurantModel{
  String? name;
  String? specials;
  double?  rate;
  bool? isFav;
  String? closeTime;


  RestaurantModel();


  factory RestaurantModel.fromJson(Map<String, dynamic> json) => _$RestaurantModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);
  
  
}