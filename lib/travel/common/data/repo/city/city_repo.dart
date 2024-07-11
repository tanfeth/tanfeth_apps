



import 'package:tanfeth_apps/common/data/model/pagination_model/PaginationModel.dart';
import 'package:tanfeth_apps/common/network/network/api/api_controller.dart';
import 'package:tanfeth_apps/common/network/network/enums/api_enum.dart';
import 'package:tanfeth_apps/travel/common/data/model/enum/EnumModel.dart';


Future<PaginationModel<List<EnumModel>>> getEmploymentsApi() async {
  try {
    var response = await ApiController(
        "/Employment/v1/Employment/GetEmployments",
        RequestTypeEnum.get)
        .sendRequest();
    return PaginationModel(
        pagination: response.pagination,
        response: EnumModel.toList(response.objectResponse).toList());
  } catch (e) {
    throw e.toString();
  }
}
