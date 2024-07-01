
import 'package:json_annotation/json_annotation.dart';

part 'CarTypeModel.g.dart';

@JsonSerializable(explicitToJson: true)

class CarTypeModel{
   String? carType;
   String? carImage;
   int? passengersNumber;
   double? tripCost;


  CarTypeModel();

  factory CarTypeModel.fromJson(Map<String, dynamic> json) => _$CarTypeModelFromJson(json);

  static List<CarTypeModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(CarTypeModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$CarTypeModelToJson(this);
}