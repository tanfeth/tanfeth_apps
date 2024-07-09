import 'package:json_annotation/json_annotation.dart';
part 'ResponseRegisterModel.g.dart';


@JsonSerializable(explicitToJson: true)
class ResponseRegisterModel{

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


  ResponseRegisterModel();

  factory ResponseRegisterModel.fromJson(Map<String, dynamic> json) => _$ResponseRegisterModelFromJson(json);

  static List<ResponseRegisterModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(ResponseRegisterModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$ResponseRegisterModelToJson(this);

}