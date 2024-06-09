

import 'package:json_annotation/json_annotation.dart';

part 'CardModel.g.dart';

@JsonSerializable(explicitToJson: true)

class CardModel {
   int? id;
   String? name;
   String? cardBrand;
  
  
  CardModel();

   factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);

   static List<CardModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(CardModel.fromJson).toList();

   Map<String, dynamic> toJson() => _$CardModelToJson(this);
}