


import 'package:tanfeth_apps/common/network/network/api/api_controller.dart';
import 'package:tanfeth_apps/common/network/network/enums/api_enum.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/BodyDeviceTokenModel.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/BodyLoginModel.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/BodyRegisterModel.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/BodyVerifyModel.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/ResponseDeviceTokenModel.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/ResponseLoginModel.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/ResponseRegisterModel.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/ResponseVerifyModel.dart';




/// Login

Future<ResponseLoginModel> loginApi({required BodyLoginModel model}) async {
  try {
    var response = await ApiController(
        customAppFlavor.endPoints.authEndPoints.login, RequestTypeEnum.post).sendRequest(body:model.toJson());
    return ResponseLoginModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}




///Verify

Future<ResponseVerifyModel> verifyApi({required BodyVerifyModel model}) async {
  try {
    var response = await ApiController(
        customAppFlavor.endPoints.authEndPoints.verify,
        RequestTypeEnum.post)
        .sendRequest(body:model.toJson() );
    return ResponseVerifyModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}



///Register

Future<ResponseRegisterModel> registerApi({required BodyRegisterModel model}) async {
  try {
    var response = await ApiController(
        customAppFlavor.endPoints.authEndPoints.register,
        RequestTypeEnum.post)
        .sendRequest(body:model.toJson() );
    return ResponseRegisterModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}

/// Device token
Future<ResponseDeviceTokenModel> deviceTokenApi({required BodyDeviceTokenModel model}) async {
  try {
    var response = await ApiController(
        customAppFlavor.endPoints.authEndPoints.deviceToken,
        RequestTypeEnum.put).sendRequest(body:model.toJson());
    return ResponseDeviceTokenModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}

