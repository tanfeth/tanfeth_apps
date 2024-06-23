// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LocationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel()
      ..placeId = json['placeId'] as String?
      ..description = json['description'] as String?
      ..locationCity = json['locationCity'] as String?
      ..isFavorite = json['isFavorite'] as bool?;

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'description': instance.description,
      'locationCity': instance.locationCity,
      'isFavorite': instance.isFavorite,
    };
