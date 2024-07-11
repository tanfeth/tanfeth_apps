

import 'package:json_annotation/json_annotation.dart';
part 'ResponseDriverCarsModel.g.dart';


@JsonSerializable(explicitToJson: true)
class ResponseDriverCarsModel{

  String ? carModel;
  String? carType;
  String? plate;
  String? carCollor;
  int? year;


  ResponseDriverCarsModel();

  factory ResponseDriverCarsModel.fromJson(Map<String, dynamic> json) => _$ResponseDriverCarsModelFromJson(json);

  static List<ResponseDriverCarsModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(ResponseDriverCarsModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$ResponseDriverCarsModelToJson(this);

}





