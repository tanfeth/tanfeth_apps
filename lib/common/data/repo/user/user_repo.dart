

import 'package:api_controller/api/api_controller.dart';
import 'package:api_controller/api/api_enum.dart';
import 'package:api_controller/model/auth/AccountModel.dart';
import 'package:api_controller/model/auth/AuthenticateResponseModel.dart';
import 'package:api_controller/model/notification/NotificationDeviceModel.dart';
import 'package:get/get.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';



Future<AuthenticateResponseModel> loginApi(
    {required int loginWay,
    String phone = "",
    String password = "",
    String token = "",
    String uid = '',
    String? appNameEnum,
    int socialType = 0,
    bool isExternalLogin = false,
    String email = ""}) async {
  Map<String, String> queryParameters = {
    "LoginWay": loginWay.toString(),
    'Culture': 'en'
  };
  Map<String, dynamic> bodyParams = {};
  if (loginWay == customAppFlavor.commonEnum.loginWayEnum.phone) {
    bodyParams['UserName'] = phone;
    bodyParams['Password'] = password;
    if (appNameEnum != null) bodyParams['AppNameEnum'] = appNameEnum;
  } else if (loginWay == customAppFlavor.commonEnum.loginWayEnum.email) {
    bodyParams['Email'] = email;
    bodyParams['Password'] = password;
    if (appNameEnum != null) bodyParams['AppNameEnum'] = appNameEnum;
  } else if (loginWay == customAppFlavor.commonEnum.loginWayEnum.socialMedia) {
    bodyParams['UserName'] = uid;
    bodyParams['isExternalLogin'] = true;
    if (appNameEnum != null) bodyParams['AppNameEnum'] = appNameEnum;
  } else {
    bodyParams['Token'] = token;
    if (appNameEnum != null) bodyParams['AppNameEnum'] = appNameEnum;
  }
  try {
    var response = await ApiController(
        customAppFlavor.endPoints.authEndPoints.login,
        RequestTypeEnum.post)
        .sendRequest(body: bodyParams, queryParameters: queryParameters);
    return AuthenticateResponseModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}



Future<AuthenticateResponseModel> registerAnonymouseApi({
  required String token,
}) async {
  Map<String, String> bodyParams = {};
  bodyParams['userName'] = token;
  try {
    var response = await ApiController(
            customAppFlavor.endPoints.authEndPoints.register,
            RequestTypeEnum.post)
        .sendRequest(body: bodyParams);
    return AuthenticateResponseModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}



Future<AccountModel> editNotificationTokenApi(String? token) async {
  if (token == null) return AccountModel();
  Map<String, String> queryParameters = {
    "NotificationToken": token,
  };
  HubConnection hubConnection = Get.find();
  if (hubConnection.connectionId != null) {
    queryParameters["ConnectionId"] = hubConnection.connectionId!;
  }
  try {
    var response = await ApiController(
            "/v1/Account/Authorization/EditNotificationToken",
            RequestTypeEnum.put)
        .sendRequest(body: queryParameters);
    return AccountModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}

Future<AccountModel> getProfileApi({int? fkAccount, int? uid}) async {
  Map<String, String> queryParameters = {};
  if (fkAccount != null && fkAccount != 0) {
    queryParameters["id"] = fkAccount.toString();
  }
  try {
    var response = await ApiController(
            "/Account/v1/Account/getAccount", RequestTypeEnum.get)
        .sendRequest(queryParameters: queryParameters);
    return AccountModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}

Future<AccountModel> getAccountByAgoraConnectionIdApi(
    {int? connectionId}) async {
  Map<String, String> queryParameters = {};
  if (connectionId != null && connectionId != 0) {
    queryParameters["connectionId"] = connectionId.toString();
  }
  try {
    var response = await ApiController(
            "/Account/v1/Account/getAccountByAgoraConnectionId",
            RequestTypeEnum.get)
        .sendRequest(queryParameters: queryParameters);
    return AccountModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}





Future<bool> addDeviceApi(
    {required NotificationDeviceModel notificationDeviceModel}) async {
  try {
    var response = await ApiController(
            "/Authentication/v1/Device/CreateUserDevice",
            RequestTypeEnum.post)
        .sendRequest(body: notificationDeviceModel.toJson());
    return response.objectResponse;
  } catch (e) {
    throw e.toString();
  }
}


Future<String> forgetPasswordApi({String email = ""}) async {
  Map<String, String> queryParameters = {"Email": email};
  try {
    var response = await ApiController(
            "/v2/Account/Authorization/ForgetPassword",
            RequestTypeEnum.post)
        .sendRequest(queryParameters: queryParameters);
    return response.objectResponse as String;
  } catch (e) {
    throw e.toString();
  }
}

Future<bool> resetUserApi({String userName = ""}) async {
  Map<String, String> queryParameters = {};
  try {
    var response = await ApiController(
            "/v1/Authentication/ResetUser", RequestTypeEnum.post)
        .sendRequest(
            queryParameters: queryParameters, body: {"userName": userName});
    return response.objectResponse;
  } catch (e) {
    throw e.toString();
  }
}

Future<bool> resetPasswordApi({String code = "", String password = ""}) async {
  try {
    var response = await ApiController(
            "/v1/Authentication/VerificateUser", RequestTypeEnum.post)
        .sendRequest(body: <String, dynamic>{
      'code': code,
      'password': password,
    });
    return response.objectResponse as bool;
  } catch (e) {
    throw e.toString();
  }
}



Future<bool> activeAccountApi({required String code}) async {
  Map<String, String> queryParameters = {};
  try {
    var response = await ApiController(
            "/v1/Authentication/ActivateAccount", RequestTypeEnum.put)
        .sendRequest(queryParameters: queryParameters, body: {"code": code});
    return response.objectResponse;
  } catch (e) {
    throw e.toString();
  }
}

Future<void> setConnectionId({required String connectionId}) async {
  Map<String, String> queryParameters = {};
  try {
    await ApiController(
            "/Account/v1/Account/SetConnectionId", RequestTypeEnum.put)
        .sendRequest(
            queryParameters: queryParameters,
            body: {"connectionId": connectionId});
  } catch (e) {
    throw e.toString();
  }
}

Future<bool> verificateCodeApi({required String code}) async {
  Map<String, String> queryParameters = {};
  try {
    var response = await ApiController(
            "/v1/Authentication/VerificateCode", RequestTypeEnum.post)
        .sendRequest(queryParameters: queryParameters, body: {"code": code});
    return response.objectResponse;
  } catch (e) {
    throw e.toString();
  }
}

Future<String> resendActivateAccountApi() async {
  Map<String, String> queryParameters = {};
  try {
    var response = await ApiController(
            "/v1/Authentication/ResendActivateAccount",
            RequestTypeEnum.post)
        .sendRequest(queryParameters: queryParameters, body: {});
    return response.objectResponse.toString();
  } catch (e) {
    throw e.toString();
  }
}
