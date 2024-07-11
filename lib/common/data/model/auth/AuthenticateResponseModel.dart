import 'package:json_annotation/json_annotation.dart';

part 'AuthenticateResponseModel.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthenticateResponseModel {
  String? name;
  String? userName;
  String? emailAddress;
  String? phoneNumber;
  String? imageUrl;
  String? authToken;

  @JsonKey()
  int? fk_Account;
  @JsonKey()
  int? fk_AccountState;
  @JsonKey()
  int? fk_AccountType;
  bool? isAdmin;
  bool? haveDoctorSubscription;


  AuthenticateResponseModel();

  factory AuthenticateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateResponseModelToJson(this);
}
