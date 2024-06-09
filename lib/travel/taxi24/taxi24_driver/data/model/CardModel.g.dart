// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel()
  ..id = (json['id'] as num?)?.toInt()
  ..name = json['name'] as String?
  ..cardBrand = json['cardBrand'] as String?;

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cardBrand': instance.cardBrand,
    };
