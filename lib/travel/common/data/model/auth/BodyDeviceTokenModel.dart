import 'package:json_annotation/json_annotation.dart';
part 'BodyDeviceTokenModel.g.dart';


@JsonSerializable(explicitToJson: true)
class BodyDeviceTokenModel{

  String? deviceToken;
  BodyDeviceTokenModel();

  factory BodyDeviceTokenModel.fromJson(Map<String, dynamic> json) => _$BodyDeviceTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$BodyDeviceTokenModelToJson(this);

}