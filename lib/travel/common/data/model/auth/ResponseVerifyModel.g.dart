// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseVerifyModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseVerifyModel _$ResponseVerifyModelFromJson(Map<String, dynamic> json) =>
    ResponseVerifyModel()
      ..token = json['token'] as String?
      ..accountState = json['accountState'] as String?
      ..isInTrip = json['isInTrip'] as bool?;

Map<String, dynamic> _$ResponseVerifyModelToJson(ResponseVerifyModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  val['accountState'] = instance.accountState;
  val['isInTrip'] = instance.isInTrip;
  return val;
}
