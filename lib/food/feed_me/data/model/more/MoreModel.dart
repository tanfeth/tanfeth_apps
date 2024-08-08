
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'MoreModel.g.dart';

@JsonSerializable(explicitToJson: true)

class MoreModel {
  String? icon;
  String? name;
  @JsonKey(includeFromJson: false,
  includeToJson: false)
  Function()? onPress;
  @JsonKey(includeFromJson: false,
      includeToJson: false)
  Widget? trailingWidget;

  MoreModel({
  this.icon,
  this.name,
  this.onPress,
    this.trailingWidget
  });
  
  factory MoreModel.fromJson(Map<String, dynamic> json) => _$MoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoreModelToJson(this);
}