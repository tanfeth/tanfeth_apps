


import 'package:tanfeth_apps/common/network/network/api/api_controller.dart';
import 'package:tanfeth_apps/common/network/network/enums/api_enum.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/BodyLoginModel.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/ResponseLoginModel.dart';



Future<ResponseLoginModel> loginApi({required BodyLoginModel model}) async {
  try {
    var response = await ApiController(
        customAppFlavor.endPoints.authEndPoints.login,
        RequestTypeEnum.post)
        .sendRequest(body:model.toJson() );
    return ResponseLoginModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}

