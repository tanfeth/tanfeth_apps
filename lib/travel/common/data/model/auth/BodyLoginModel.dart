import 'package:json_annotation/json_annotation.dart';
part 'BodyLoginModel.g.dart';


@JsonSerializable(explicitToJson: true)
class BodyLoginModel{

  @JsonKey(name: 'PhoneNumber')
  String ? phoneNumber;
  BodyLoginModel();

  factory BodyLoginModel.fromJson(Map<String, dynamic> json) => _$BodyLoginModelFromJson(json);

  static List<BodyLoginModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(BodyLoginModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$BodyLoginModelToJson(this);
  
}