// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TripsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripsModel _$TripsModelFromJson(Map<String, dynamic> json) => TripsModel()
  ..totalTrips = (json['totalTrips'] as num?)?.toInt()
  ..completedTrips = (json['completedTrips'] as num?)?.toInt()
  ..rejectedTrips = (json['rejectedTrips'] as num?)?.toInt()
  ..cancelledTripFromUser = (json['cancelledTripFromUser'] as num?)?.toInt()
  ..passengerDidNotShow = (json['passengerDidNotShow'] as num?)?.toInt()
  ..lastTrips = (json['lastTrips'] as List<dynamic>?)
      ?.map((e) => TripModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$TripsModelToJson(TripsModel instance) =>
    <String, dynamic>{
      'totalTrips': instance.totalTrips,
      'completedTrips': instance.completedTrips,
      'rejectedTrips': instance.rejectedTrips,
      'cancelledTripFromUser': instance.cancelledTripFromUser,
      'passengerDidNotShow': instance.passengerDidNotShow,
      'lastTrips': instance.lastTrips?.map((e) => e.toJson()).toList(),
    };
