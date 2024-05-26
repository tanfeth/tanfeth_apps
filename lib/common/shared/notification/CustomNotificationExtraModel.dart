import 'package:json_annotation/json_annotation.dart';

part 'CustomNotificationExtraModel.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomNotificationExtraModel {
  CustomNotificationExtraModel();

  String? OpenType;
  int? NotificationId;
  String? OpenValue;
  String? ImgUrl;
  String? LogoUrl;

  factory CustomNotificationExtraModel.fromJson(Map<String, dynamic> json) =>
      _$CustomNotificationExtraModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomNotificationExtraModelToJson(this);
}
