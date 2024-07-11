



import 'package:tanfeth_apps/common/data/model/pagination_model/PaginationModel.dart';
import 'package:tanfeth_apps/common/network/network/api/api_controller.dart';
import 'package:tanfeth_apps/common/network/network/enums/api_enum.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/data/model/enum/EnumModel.dart';



///Cities

Future<PaginationModel<List<EnumModel>>> getCitiesApi() async {
  try {
    var response = await ApiController(
        customAppFlavor.endPoints.getCities,
        RequestTypeEnum.get)
        .sendRequest();
    return PaginationModel(
        pagination: response.pagination,
        response: EnumModel.toList(response.objectResponse).toList());
  } catch (e) {
    throw e.toString();
  }
}
