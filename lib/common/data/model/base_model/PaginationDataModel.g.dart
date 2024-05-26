// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PaginationDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationDataModel _$PaginationDataModelFromJson(Map<String, dynamic> json) =>
    PaginationDataModel()
      ..total = (json['total'] as num?)?.toInt()
      ..lastPage = (json['lastPage'] as num?)?.toInt()
      ..perPage = (json['perPage'] as num?)?.toInt()
      ..currentPage = (json['currentPage'] as num?)?.toInt();

Map<String, dynamic> _$PaginationDataModelToJson(
        PaginationDataModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'lastPage': instance.lastPage,
      'perPage': instance.perPage,
      'currentPage': instance.currentPage,
    };
