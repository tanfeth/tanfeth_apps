// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BankModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankModel _$BankModelFromJson(Map<String, dynamic> json) => BankModel()
  ..id = (json['id'] as num?)?.toInt()
  ..name = json['name'] as String?
  ..bank = json['bank'] as String?
  ..iBan = json['iBan'] as String?;

Map<String, dynamic> _$BankModelToJson(BankModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bank': instance.bank,
      'iBan': instance.iBan,
    };
