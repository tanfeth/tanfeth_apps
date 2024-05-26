import 'package:json_annotation/json_annotation.dart';
import 'package:tanfeth_apps/common/data/model/base_model/BaseModel.dart';

part 'NotificationDeviceModel.g.dart';

@JsonSerializable(explicitToJson: true)
class NotificationDeviceModel extends BaseModel {
  String? notificationToken;
  String? deviceType;
  String? appVersion;
  String? deviceVersion;
  String? deviceModel;

  NotificationDeviceModel();

  factory NotificationDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationDeviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDeviceModelToJson(this);
}
