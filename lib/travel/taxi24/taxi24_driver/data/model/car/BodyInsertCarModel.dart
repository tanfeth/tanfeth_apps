

import 'package:file_picker/file_picker.dart';
import 'package:json_annotation/json_annotation.dart';
part 'BodyInsertCarModel.g.dart';


@JsonSerializable(explicitToJson: true)
class BodyInsertCarModel{

  @JsonKey(name: 'CarTypeId')
  int ? carTypeId;
  @JsonKey(name: 'CarModelId')
  int ? carModelId;

  @JsonKey(name: 'CarYear')
  int ? carYear;
  @JsonKey(name: 'PlateType')
  int ? plateType;

  @JsonKey(name: 'PlateNumber')
  int ? plateNumber;

  @JsonKey(name: 'PlateLetterRight')
  int ? plateLetterRight;
  @JsonKey(name: 'PlateLetterMiddle')
  int ? plateLetterMiddle;
  @JsonKey(name: 'PlateLetterLeft')
  int ? plateLetterLeft;


  @JsonKey(name:'Images',includeIfNull: false,
      includeFromJson: false,
  includeToJson: false)

  List<PlatformFile> images = [];


  BodyInsertCarModel();

  factory BodyInsertCarModel.fromJson(Map<String, dynamic> json) => _$BodyInsertCarModelFromJson(json);

  static List<BodyInsertCarModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(BodyInsertCarModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$BodyInsertCarModelToJson(this);

}
