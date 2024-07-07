// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeAnimateModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeAnimateModel _$HomeAnimateModelFromJson(Map<String, dynamic> json) =>
    HomeAnimateModel(
      header: json['header'] as bool? ?? false,
      confirmFooter: json['confirmFooter'] as bool? ?? false,
      tripFooter: json['tripFooter'] as bool? ?? false,
      findDriver: json['findDriver'] as bool? ?? false,
    );

Map<String, dynamic> _$HomeAnimateModelToJson(HomeAnimateModel instance) =>
    <String, dynamic>{
      'header': instance.header,
      'confirmFooter': instance.confirmFooter,
      'tripFooter': instance.tripFooter,
      'findDriver': instance.findDriver,
    };
