
import 'package:json_annotation/json_annotation.dart';

part 'OfferModel.g.dart';

@JsonSerializable(explicitToJson: true)

class OfferModel {
  String? image;
  String? name;
  String? description;

  OfferModel();
  factory OfferModel.fromJson(Map<String, dynamic> json) => _$OfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfferModelToJson(this);
}