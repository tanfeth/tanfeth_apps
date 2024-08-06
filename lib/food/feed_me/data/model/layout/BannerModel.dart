import 'package:json_annotation/json_annotation.dart';

part 'BannerModel.g.dart';

@JsonSerializable(explicitToJson: true)
class BannerModel {
  num? id;
  @JsonKey(name: 'type_enum')
  String? typeEnum;
  String? type;
  String? image;
  String? link;

  BannerModel();

  factory BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}
