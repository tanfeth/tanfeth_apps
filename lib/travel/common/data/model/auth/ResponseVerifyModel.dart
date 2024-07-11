import 'package:json_annotation/json_annotation.dart';
part 'ResponseVerifyModel.g.dart';


@JsonSerializable(explicitToJson: true)
class ResponseVerifyModel{

  @JsonKey(name: 'token',includeIfNull: false)
  String ? token;

  @JsonKey(name: 'accountState')
  String ? accountState;

  @JsonKey(name: 'isInTrip')
  bool ? isInTrip;

  ResponseVerifyModel();

  factory ResponseVerifyModel.fromJson(Map<String, dynamic> json) => _$ResponseVerifyModelFromJson(json);

  static List<ResponseVerifyModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(ResponseVerifyModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$ResponseVerifyModelToJson(this);

}