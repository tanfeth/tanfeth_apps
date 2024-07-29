

import 'package:api_controller/model/base_model/ParamBaseModel.dart';
import 'package:api_controller/model/pagination_model/PaginationModel.dart';
import 'package:api_controller/api/api_controller.dart';
import 'package:api_controller/api/api_enum.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/data/model/enum/EnumModel.dart';

/// App enum

Future<PaginationModel<List<EnumModel>>> getAppEnumApi({required
ParamBaseModel model}) async {
  try {
    var queryParameters = model.toJson();
    var response = await ApiController(
        customAppFlavor.endPoints.appEnumEndPoints.appEnum,
        RequestTypeEnum.get)
        .sendRequest(queryParameters: queryParameters);
    return PaginationModel(
        pagination: response.pagination,
        response: EnumModel.toList(response.objectResponse).toList());
  } catch (e) {
    throw e.toString();
  }
}




/// Gender enum

Future<PaginationModel<List<EnumModel>>> getGenderEnumApi({required
ParamBaseModel model}) async {
  try {
    var queryParameters = model.toJson();
    var response = await ApiController(
        customAppFlavor.endPoints.appEnumEndPoints.genderEnum,
        RequestTypeEnum.get)
        .sendRequest(queryParameters: queryParameters);
    return PaginationModel(
        pagination: response.pagination,
        response: EnumModel.toList(response.objectResponse).toList());
  } catch (e) {
    throw e.toString();
  }
}




/// Attachment States Enum

Future<PaginationModel<List<EnumModel>>> getAttachmentStatesEnumApi({required
ParamBaseModel model}) async {
  try {
    var queryParameters = model.toJson();
    var response = await ApiController(
        customAppFlavor.endPoints.appEnumEndPoints.attachmentStatesEnum,
        RequestTypeEnum.get)
        .sendRequest(queryParameters: queryParameters);
    return PaginationModel(
        pagination: response.pagination,
        response: EnumModel.toList(response.objectResponse).toList());
  } catch (e) {
    throw e.toString();
  }
}




/// Account enum

Future<PaginationModel<List<EnumModel>>> getAccountStatesEnumApi({required
ParamBaseModel model}) async {
  try {
    var queryParameters = model.toJson();
    var response = await ApiController(
        customAppFlavor.endPoints.appEnumEndPoints.accountStatesEnum,
        RequestTypeEnum.get)
        .sendRequest(queryParameters: queryParameters);
    return PaginationModel(
        pagination: response.pagination,
        response: EnumModel.toList(response.objectResponse).toList());
  } catch (e) {
    throw e.toString();
  }
}


