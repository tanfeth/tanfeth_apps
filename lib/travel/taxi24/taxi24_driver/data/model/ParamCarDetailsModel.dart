
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'ParamCarDetailsModel.g.dart';

@JsonSerializable(explicitToJson: true)


class ParamCarDetailsModel {

  String? carType;
  String? carModel;
  String? carYearModel;
  String? carSeatType;
   bool? isDisable;
  String?  plateNumber;
  String?  plateLetterRight;
  String?  plateLetterMiddle;
  String?  plateLetterLeft;
  String?  sequenceNumber;
  String?  color;
  ParamCarDetailsModel({
    this.carType,
    this.carModel,
    this.carYearModel,
    this.carSeatType,
    this.isDisable,
    this.plateNumber,
    this.plateLetterRight,
    this.plateLetterMiddle,
    this.plateLetterLeft,
    this.sequenceNumber,
    this.color,
   });
  
  factory ParamCarDetailsModel.fromJson(Map<String, dynamic> json) => _$ParamCarDetailsModelFromJson(json);

  static List<ParamCarDetailsModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(ParamCarDetailsModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$ParamCarDetailsModelToJson(this);

  ParamCarDetailsModel copyWith({
    String? carType,
  String? carModel,
  String? carYearModel,
  String? carSeatType,
  bool? isDisable,
  String?  plateNumber,
  String?  plateLetterRight,
  String?  plateLetterMiddle,
  String?  plateLetterLeft,
  String?  sequenceNumber,
  String?  color}) => ParamCarDetailsModel(
      carType: carType ?? this.carType,
      carModel: carModel ?? this.carModel,
    carYearModel: carYearModel ?? this.carYearModel,
    carSeatType: carSeatType ?? this.carSeatType,
    isDisable: isDisable ?? this.isDisable,
    plateNumber: plateNumber ?? this.plateNumber,
    plateLetterRight: plateLetterRight ?? this.plateLetterRight,
    plateLetterMiddle: plateLetterMiddle ?? this.plateLetterMiddle,
    plateLetterLeft: plateLetterLeft ?? this.plateLetterLeft,
    sequenceNumber: sequenceNumber ?? this.sequenceNumber,
    color: color ?? this.color,
  );


} 

