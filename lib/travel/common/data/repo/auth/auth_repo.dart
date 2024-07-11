


import 'package:tanfeth_apps/common/network/network/api/api_controller.dart';
import 'package:tanfeth_apps/common/network/network/enums/api_enum.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/BodyLoginModel.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/ResponseLoginModel.dart';



Future<ResponseLoginModel> loginApi({required BodyLoginModel model}) async {
  try {
    var response = await ApiController(
        "/Employment/v1/Employment/GetEmployment",
        RequestTypeEnum.get)
        .sendRequest(body:model.toJson() );
    return ResponseLoginModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}

