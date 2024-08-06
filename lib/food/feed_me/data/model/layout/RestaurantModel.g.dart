// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RestaurantModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) =>
    RestaurantModel()
      ..name = json['name'] as String?
      ..specials = json['specials'] as String?
      ..rate = (json['rate'] as num?)?.toDouble()
      ..isFav = json['isFav'] as bool?
      ..closeTime = json['closeTime'] as String?;

Map<String, dynamic> _$RestaurantModelToJson(RestaurantModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'specials': instance.specials,
      'rate': instance.rate,
      'isFav': instance.isFav,
      'closeTime': instance.closeTime,
    };
