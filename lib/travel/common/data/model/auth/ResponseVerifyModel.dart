import 'package:json_annotation/json_annotation.dart';
part 'ResponseVerifyModel.g.dart';


@JsonSerializable(explicitToJson: true)
class ResponseVerifyModel{

  String? accountState;

  bool? isInTrip;

  ResponseVerifyModel();

  factory ResponseVerifyModel.fromJson(Map<String, dynamic> json) => _$ResponseVerifyModelFromJson(json);

  static List<ResponseVerifyModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(ResponseVerifyModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$ResponseVerifyModelToJson(this);

}