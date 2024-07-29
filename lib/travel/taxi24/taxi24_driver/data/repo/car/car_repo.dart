import 'package:api_controller/model/pagination_model/PaginationModel.dart';
import 'package:api_controller/api/api_controller.dart';
import 'package:api_controller/api/api_enum.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/data/model/enum/EnumModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/car/BodyInsertCarModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/car/BodyUploadCarAttachmentModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/car/ParamCarModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/car/ResponseDriverCarsModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/driver/ResponseDriverStatusModel.dart';



///Get car types
Future<PaginationModel<List<EnumModel>>> getCarTypesApi() async {
  try {
    var response = await ApiController(
            customAppFlavor.endPoints.carEndPoints.getCarTypes,
            RequestTypeEnum.get)
        .sendRequest();
    return PaginationModel(
        pagination: response.pagination,
        response: EnumModel.toList(response.objectResponse).toList());
  } catch (e) {
    throw e.toString();
  }
}

///Get car models
Future<PaginationModel<List<EnumModel>>> getCarModelsApi(
    {required ParamCarModel model}) async {
  try {
    var queryParameters = model.toJson();
    var response = await ApiController(
            customAppFlavor.endPoints.carEndPoints.getCarModels,
            RequestTypeEnum.get)
        .sendRequest(queryParameters: queryParameters);
    return PaginationModel(
        pagination: response.pagination,
        response: EnumModel.toList(response.objectResponse).toList());
  } catch (e) {
    throw e.toString();
  }
}

///Insert car

Future<ResponseDriverStatusModel> insertCarApi(
    {required BodyInsertCarModel model}) async {
  List<FileMultiPart> files = [];
  var body = model.toJson();

  if (model.images.isNotEmpty) {
    for (var element in model.images) {
      files.add(FileMultiPart(key: "Images", platformFile: element));
    }
  }
  try {
    var response = await ApiController(
            customAppFlavor.endPoints.carEndPoints.insertCar,
            RequestTypeEnum.post)
        .sendRequest(body: body, files: files, isMultiPart: true);
    return ResponseDriverStatusModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}

///Upload car attachments

Future<ResponseDriverStatusModel> uploadCarAttachmentsApi(
    {required BodyUploadCarAttachmentModel model}) async {
  List<FileMultiPart> files = [];

  if (model.carInsurance != null) {
    files.add(
        FileMultiPart(key: "CarInsurance", platformFile: model.carInsurance!));
  }

  if (model.vehicalRegistration != null) {
    files.add(FileMultiPart(
        key: "VehicalRegistration", platformFile: model.vehicalRegistration!));
  }

  try {
    var body = model.toJson();
    var response = await ApiController(
            customAppFlavor.endPoints.carEndPoints.uploadCarAttachments,
            RequestTypeEnum.post)
        .sendRequest(body: body, files: files, isMultiPart: true);
    return ResponseDriverStatusModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}

///Get driver cars response
Future<PaginationModel<List<ResponseDriverCarsModel>>>
    getDriverCarsResponseApi() async {
  try {
    var response = await ApiController(
            customAppFlavor.endPoints.carEndPoints.getDriverCarsResponse,
            RequestTypeEnum.get)
        .sendRequest();
    return PaginationModel(
        pagination: response.pagination,
        response:
            ResponseDriverCarsModel.toList(response.objectResponse).toList());
  } catch (e) {
    throw e.toString();
  }
}
