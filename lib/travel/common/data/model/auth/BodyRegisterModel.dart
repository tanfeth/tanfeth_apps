import 'package:json_annotation/json_annotation.dart';
part 'BodyRegisterModel.g.dart';


@JsonSerializable(explicitToJson: true)
class BodyRegisterModel{

  @JsonKey(name: 'Name')
  String ? name;

  @JsonKey(name: 'IdentityNumber')
  String ? identityNumber;

  @JsonKey(name: 'UserName')
  String ? phoneNumber;

  @JsonKey(name: 'Email')
  String ? email;

  @JsonKey(name: 'DateOfBirth')
  String ? dateOfBirth;

  @JsonKey(name: 'Gender')
  int ? gender;

  @JsonKey(name: 'DeviceToken')
  String ? deviceToken;

  @JsonKey(name: 'CityId')
  int ? city;


  BodyRegisterModel();

  factory BodyRegisterModel.fromJson(Map<String, dynamic> json) => _$BodyRegisterModelFromJson(json);

  static List<BodyRegisterModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(BodyRegisterModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$BodyRegisterModelToJson(this);

}