

import 'package:file_picker/file_picker.dart';
import 'package:json_annotation/json_annotation.dart';
part 'BodyUploadCarAttachmentModel.g.dart';


@JsonSerializable(explicitToJson: true)
class BodyUploadCarAttachmentModel{

  @JsonKey(name: 'CarId')
  int ? carId;

  @JsonKey(name: 'CarInsurance',
  includeToJson: false,includeFromJson: false)
  PlatformFile ? carInsurance;

  @JsonKey(name: 'CarInsuranceExpiryDate')
  String? carInsuranceExpiryDate;


  @JsonKey(name: 'VehicalRegistration',
      includeToJson: false,includeFromJson: false)
  PlatformFile? vehicalRegistration;

  @JsonKey(name: 'VehicalRegistrationExpiryDate')
  String? vehicalRegistrationExpiryDate;






  BodyUploadCarAttachmentModel();

  factory BodyUploadCarAttachmentModel.fromJson(Map<String, dynamic> json) => _$BodyUploadCarAttachmentModelFromJson(json);

  static List<BodyUploadCarAttachmentModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(BodyUploadCarAttachmentModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$BodyUploadCarAttachmentModelToJson(this);

}


