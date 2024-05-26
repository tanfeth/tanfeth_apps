// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccountModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel()
  ..id = (json['id'] as num).toInt()
  ..isAdded = json['isAdded'] as bool?
  ..createdBy = json['createdBy'] as String?
  ..createdAt = json['createdAt'] as String?
  ..lastModifiedBy = json['lastModifiedBy'] as String?
  ..lastModifiedAt = json['lastModifiedAt'] as String?
  ..imageUrl = json['imageUrl'] as String?
  ..UniqueName = json['UniqueName'] as String?
  ..instagramUrl = json['instagramUrl'] as String?
  ..firstName = json['firstName'] as String?
  ..lastName = json['lastName'] as String?
  ..QRImageUrl = json['QRImageUrl'] as String?
  ..nickName = json['nickName'] as String?
  ..name = json['name'] as String?
  ..emailAddress = json['emailAddress'] as String?
  ..phoneNumber = json['phoneNumber'] as String?
  ..passwordHash = json['passwordHash'] as String?
  ..File = json['File'] as String?
  ..Token = json['Token'] as String?
  ..birthDate = json['birthDate'] as String?
  ..nationalID = json['nationalID'] as String?
  ..facebookUrl = json['facebookUrl'] as String?
  ..linkedinUrl = json['linkedinUrl'] as String?
  ..twitterUrl = json['twitterUrl'] as String?
  ..fk_AccountType = (json['fk_AccountType'] as num?)?.toInt()
  ..insuranceNumber = json['insuranceNumber'] as String?
  ..fk_Gender = (json['fk_Gender'] as num?)?.toInt()
  ..fk_AccountState = (json['fk_AccountState'] as num?)?.toInt()
  ..accountCheckerEnum = (json['accountCheckerEnum'] as num?)?.toInt()
  ..isAdmin = json['isAdmin'] as bool?
  ..otherLang = json['otherLang'] as bool?
  ..MedicalFacilityName = json['MedicalFacilityName'] as String?
  ..JobTitleDes = json['JobTitleDes'] as String?
  ..accountName = json['accountName'] as String?
  ..about = json['about'] as String?
  ..bio = json['bio'] as String?
  ..agoraConnectionId = json['agoraConnectionId'] as String?
  ..fk_Doctor = (json['fk_Doctor'] as num?)?.toInt()
  ..fk_Patient = (json['fk_Patient'] as num?)?.toInt()
  ..fk_Area = (json['fk_Area'] as num?)?.toInt()
  ..shortTitle = json['shortTitle'] as String?
  ..graduationInfo = json['graduationInfo'] as String?
  ..practisesInfo = json['practisesInfo'] as String?
  ..experienceYears = (json['experienceYears'] as num?)?.toInt()
  ..fk_DoctorDegree = (json['fk_DoctorDegree'] as num?)?.toInt()
  ..specializations = (json['specializations'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList()
  ..spokenLanguages = (json['spokenLanguages'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList()
  ..totalPoints = (json['totalPoints'] as num?)?.toInt()
  ..totalPointsWeek = (json['totalPointsWeek'] as num?)?.toInt()
  ..myRanking = (json['myRanking'] as num?)?.toInt()
  ..myRankingWeek = (json['myRankingWeek'] as num?)?.toInt()
  ..attemptsPoints = (json['attemptsPoints'] as num?)?.toInt();

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'isAdded': instance.isAdded,
    'createdBy': instance.createdBy,
    'createdAt': instance.createdAt,
    'lastModifiedBy': instance.lastModifiedBy,
    'lastModifiedAt': instance.lastModifiedAt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageUrl', instance.imageUrl);
  writeNotNull('UniqueName', instance.UniqueName);
  writeNotNull('instagramUrl', instance.instagramUrl);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('QRImageUrl', instance.QRImageUrl);
  writeNotNull('nickName', instance.nickName);
  writeNotNull('name', instance.name);
  writeNotNull('emailAddress', instance.emailAddress);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('passwordHash', instance.passwordHash);
  writeNotNull('File', instance.File);
  writeNotNull('Token', instance.Token);
  writeNotNull('birthDate', instance.birthDate);
  writeNotNull('nationalID', instance.nationalID);
  writeNotNull('facebookUrl', instance.facebookUrl);
  writeNotNull('linkedinUrl', instance.linkedinUrl);
  writeNotNull('twitterUrl', instance.twitterUrl);
  writeNotNull('fk_AccountType', instance.fk_AccountType);
  writeNotNull('insuranceNumber', instance.insuranceNumber);
  writeNotNull('fk_Gender', instance.fk_Gender);
  writeNotNull('fk_AccountState', instance.fk_AccountState);
  writeNotNull('accountCheckerEnum', instance.accountCheckerEnum);
  writeNotNull('isAdmin', instance.isAdmin);
  writeNotNull('otherLang', instance.otherLang);
  writeNotNull('MedicalFacilityName', instance.MedicalFacilityName);
  writeNotNull('JobTitleDes', instance.JobTitleDes);
  writeNotNull('accountName', instance.accountName);
  writeNotNull('about', instance.about);
  writeNotNull('bio', instance.bio);
  writeNotNull('agoraConnectionId', instance.agoraConnectionId);
  writeNotNull('fk_Doctor', instance.fk_Doctor);
  writeNotNull('fk_Patient', instance.fk_Patient);
  writeNotNull('fk_Area', instance.fk_Area);
  writeNotNull('shortTitle', instance.shortTitle);
  writeNotNull('graduationInfo', instance.graduationInfo);
  writeNotNull('practisesInfo', instance.practisesInfo);
  writeNotNull('experienceYears', instance.experienceYears);
  writeNotNull('fk_DoctorDegree', instance.fk_DoctorDegree);
  writeNotNull('specializations', instance.specializations);
  writeNotNull('spokenLanguages', instance.spokenLanguages);
  writeNotNull('totalPoints', instance.totalPoints);
  writeNotNull('totalPointsWeek', instance.totalPointsWeek);
  writeNotNull('myRanking', instance.myRanking);
  writeNotNull('myRankingWeek', instance.myRankingWeek);
  writeNotNull('attemptsPoints', instance.attemptsPoints);
  return val;
}
