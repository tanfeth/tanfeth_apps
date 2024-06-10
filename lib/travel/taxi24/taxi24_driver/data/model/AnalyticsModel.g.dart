// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnalyticsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyticsModel _$AnalyticsModelFromJson(Map<String, dynamic> json) =>
    AnalyticsModel()
      ..analysis = (json['analysis'] as List<dynamic>?)
          ?.map((e) => AnalysisModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..duration = json['duration'] as String?
      ..trips = json['trips']
      ..netEarnings = json['netEarnings']
      ..tip = json['tip']
      ..cancelTripFees = json['cancelTripFees']
      ..totalEarnings = json['totalEarnings'];

Map<String, dynamic> _$AnalyticsModelToJson(AnalyticsModel instance) =>
    <String, dynamic>{
      'analysis': instance.analysis?.map((e) => e.toJson()).toList(),
      'duration': instance.duration,
      'trips': instance.trips,
      'netEarnings': instance.netEarnings,
      'tip': instance.tip,
      'cancelTripFees': instance.cancelTripFees,
      'totalEarnings': instance.totalEarnings,
    };
