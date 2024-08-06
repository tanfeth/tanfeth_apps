
import 'package:json_annotation/json_annotation.dart';

part 'CategoryModel.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryModel {


  String? image;
  String? name;
  CategoryModel();



  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);


}