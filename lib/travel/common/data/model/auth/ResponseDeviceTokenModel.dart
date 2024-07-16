import 'package:json_annotation/json_annotation.dart';
part 'ResponseDeviceTokenModel.g.dart';


@JsonSerializable(explicitToJson: true)
class ResponseDeviceTokenModel{

  String? deviceToken;
  ResponseDeviceTokenModel();

  factory ResponseDeviceTokenModel.fromJson(Map<String, dynamic> json) => _$ResponseDeviceTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDeviceTokenModelToJson(this);

}