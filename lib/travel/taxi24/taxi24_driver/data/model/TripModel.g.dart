// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TripModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripModel _$TripModelFromJson(Map<String, dynamic> json) => TripModel()
  ..orderId = (json['orderId'] as num?)?.toInt()
  ..destinationName = json['destinationName'] as String?
  ..totalPrice = (json['totalPrice'] as num?)?.toDouble()
  ..tripStatus = json['tripStatus'] as String?
  ..creationDate = json['creationDate'] as String?;

Map<String, dynamic> _$TripModelToJson(TripModel instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'destinationName': instance.destinationName,
      'totalPrice': instance.totalPrice,
      'tripStatus': instance.tripStatus,
      'creationDate': instance.creationDate,
    };
