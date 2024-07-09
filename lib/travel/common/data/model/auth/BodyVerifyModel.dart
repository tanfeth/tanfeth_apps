import 'package:json_annotation/json_annotation.dart';
part 'BodyVerifyModel.g.dart';


@JsonSerializable(explicitToJson: true)
class BodyVerifyModel{

  @JsonKey(name: 'PhoneNumber')
  String ? phoneNumber;

  @JsonKey(name: 'Code')
  String ? code;

  @JsonKey(name: 'AppEnum')
  String ? appEnum;



  BodyVerifyModel();

  factory BodyVerifyModel.fromJson(Map<String, dynamic> json) => _$BodyVerifyModelFromJson(json);

  static List<BodyVerifyModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(BodyVerifyModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$BodyVerifyModelToJson(this);

}