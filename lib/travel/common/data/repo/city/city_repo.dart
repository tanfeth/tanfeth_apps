



import 'package:api_controller/model/base_model/ParamBaseModel.dart';
import 'package:api_controller/model/pagination_model/PaginationModel.dart';
import 'package:api_controller/api/api_controller.dart';
import 'package:api_controller/api/api_enum.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/data/model/enum/EnumModel.dart';



///Cities

Future<PaginationModel<List<EnumModel>>> getCitiesApi({required
  ParamBaseModel model}) async {
  try {
    var queryParameters = model.toJson();
    var response = await ApiController(
        customAppFlavor.endPoints.getCities,
        RequestTypeEnum.get)
        .sendRequest(queryParameters: queryParameters);
    return PaginationModel(
        pagination: response.pagination,
        response: EnumModel.toList(response.objectResponse).toList());
  } catch (e) {
    throw e.toString();
  }
}
