import 'package:json_annotation/json_annotation.dart';
part 'ResponseLoginModel.g.dart';


@JsonSerializable(explicitToJson: true)
class ResponseLoginModel{

  @JsonKey(name: 'success')
  bool ? success;
  ResponseLoginModel();

  factory ResponseLoginModel.fromJson(Map<String, dynamic> json) => _$ResponseLoginModelFromJson(json);

  static List<ResponseLoginModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(ResponseLoginModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$ResponseLoginModelToJson(this);

}