
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
  ParamCarDetailsModel();
  
  factory ParamCarDetailsModel.fromJson(Map<String, dynamic> json) => _$ParamCarDetailsModelFromJson(json);

  static List<ParamCarDetailsModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(ParamCarDetailsModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$ParamCarDetailsModelToJson(this);
  
  
} 

