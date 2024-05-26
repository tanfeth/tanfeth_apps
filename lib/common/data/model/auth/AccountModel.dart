import 'package:json_annotation/json_annotation.dart';
import 'package:tanfeth_apps/common/data/model/base_model/BaseModel.dart';
part 'AccountModel.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountModel extends BaseModel {
  @JsonKey(includeIfNull: false)
  String? imageUrl;
  @JsonKey(includeIfNull: false)
  String? UniqueName;
  @JsonKey(includeIfNull: false)
  String? instagramUrl;
  @JsonKey(includeIfNull: false)
  String? firstName;
  @JsonKey(includeIfNull: false)
  String? lastName;
  @JsonKey(includeIfNull: false)
  String? QRImageUrl;
  @JsonKey(includeIfNull: false)
  String? nickName;
  @JsonKey(includeIfNull: false)
  String? name;
  @JsonKey(includeIfNull: false)
  String? emailAddress;
  @JsonKey(includeIfNull: false)
  String? phoneNumber;
  @JsonKey(includeIfNull: false)
  String? passwordHash;
  @JsonKey(includeIfNull: false)
  String? File;
  @JsonKey(includeIfNull: false)
  String? Token;
  @JsonKey(includeIfNull: false)
  String? birthDate;
  @JsonKey(includeIfNull: false)
  String? nationalID;
  @JsonKey(includeIfNull: false)
  String? facebookUrl;
  @JsonKey(includeIfNull: false)
  String? linkedinUrl;
  @JsonKey(includeIfNull: false)
  String? twitterUrl;
  @JsonKey(includeIfNull: false)
  int? fk_AccountType;
  @JsonKey(includeIfNull: false)
  String? insuranceNumber;
  @JsonValue(0)
  @JsonKey(includeIfNull: false)
  int? fk_Gender;
  @JsonKey(includeIfNull: false)
  int? fk_AccountState;


  @JsonKey(includeIfNull: false)
  int? accountCheckerEnum;

  @JsonKey(ignore: true)
  bool isOnline = false;
  @JsonKey(includeIfNull: false)
  bool? isAdmin;
  @JsonKey(includeIfNull: false)
  bool? otherLang;
  @JsonKey(includeIfNull: false)
  String? MedicalFacilityName;
  @JsonKey(includeIfNull: false)
  String? JobTitleDes;
  @JsonKey(includeIfNull: false)
  String? accountName;
  @JsonKey(includeIfNull: false)
  String? about;
  @JsonKey(includeIfNull: false)
  String? bio;
  @JsonKey(includeIfNull: false)
  String? agoraConnectionId;
  @JsonKey(includeIfNull: false)
  int? fk_Doctor;
  @JsonKey(includeIfNull: false)
  int? fk_Patient;
  @JsonKey(includeIfNull: false)
  int? fk_Area;

  @JsonKey(includeIfNull: false)
  String? shortTitle;
  @JsonKey(includeIfNull: false)
  String? graduationInfo;
  @JsonKey(includeIfNull: false)
  String? practisesInfo;
  @JsonKey(includeIfNull: false)
  int? experienceYears;
  @JsonKey(includeIfNull: false)
  int? fk_DoctorDegree;
  @JsonKey(includeIfNull: false)
  List<int>? specializations;
  @JsonKey(includeIfNull: false)
  List<int>? spokenLanguages;
  @JsonKey(includeIfNull: false)

  @JsonKey(includeIfNull: false)
  int? totalPoints;
  @JsonKey(includeIfNull: false)
  int? totalPointsWeek;
  @JsonKey(includeIfNull: false)
  int? myRanking;
  @JsonKey(includeIfNull: false)
  int? myRankingWeek;
  @JsonKey(includeIfNull: false)
  int? attemptsPoints;

  AccountModel();

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  static List<AccountModel> toList(dynamic jsonArray) =>
      List<Map<String, dynamic>>.from(jsonArray)
          .map(AccountModel.fromJson)
          .toList();

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
