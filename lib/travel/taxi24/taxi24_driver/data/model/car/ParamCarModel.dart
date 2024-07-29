import 'package:api_controller/model/base_model/ParamBaseModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ParamCarModel.g.dart';


@JsonSerializable(explicitToJson: true)
class ParamCarModel extends ParamBaseModel{
  String ? carTypeCode;


  ParamCarModel();

  factory ParamCarModel.fromJson(Map<String, dynamic> json) => _$ParamCarModelFromJson(json);

  static List<ParamCarModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(ParamCarModel.fromJson).toList();

  @override
  Map<String, dynamic> toJson() => _$ParamCarModelToJson(this);

}


