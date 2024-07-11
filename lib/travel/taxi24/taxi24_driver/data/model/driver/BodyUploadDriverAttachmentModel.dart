


import 'package:file_picker/file_picker.dart';
import 'package:json_annotation/json_annotation.dart';

part 'BodyUploadDriverAttachmentModel.g.dart';

@JsonSerializable(explicitToJson: true)

class BodyUploadDriverAttachmentModel {

  @JsonKey(name: 'ProfileImage',
  includeFromJson: false,includeToJson: false)
  PlatformFile? profileImage;

  @JsonKey(name: 'License',
      includeFromJson: false,includeToJson: false)
  PlatformFile? license;

  @JsonKey(name: 'LicenceExpiryDate')
  String? licenceExpiryDate;


  @JsonKey(name: 'SaudiId',
      includeFromJson: false,includeToJson: false)
  PlatformFile? saudiId;

  @JsonKey(name: 'SaudiIdExpiryDate')
  String? saudiIdExpiryDate;


  BodyUploadDriverAttachmentModel();

  factory BodyUploadDriverAttachmentModel.fromJson(Map<String, dynamic> json) => _$BodyUploadDriverAttachmentModelFromJson(json);

  static List<BodyUploadDriverAttachmentModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(BodyUploadDriverAttachmentModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$BodyUploadDriverAttachmentModelToJson(this);



}

