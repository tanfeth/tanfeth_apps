


import 'package:file_picker/file_picker.dart';
import 'package:tanfeth_apps/common/network/network/api/api_controller.dart';
import 'package:tanfeth_apps/common/network/network/enums/api_enum.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/driver/BodyUpdateDriverModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/driver/BodyUploadDriverAttachmentModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/driver/ResponseDriverProfileModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/driver/ResponseDriverStatusModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/driver/ResponseUpdateDriverModel.dart';





/// Driver
Future<ResponseUpdateDriverModel> driverApi({required BodyUpdateDriverModel model}) async {
  try {
    var response = await ApiController(
        customAppFlavor.endPoints.driverEndPoints.driver,
        RequestTypeEnum.put)
        .sendRequest();
    return ResponseUpdateDriverModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}


/// Upload driver attachment
Future<ResponseDriverStatusModel> uploadDriverAttachmentApi({required BodyUploadDriverAttachmentModel model}) async {
  List<FileMultiPart> files = [];
  var body = model.toJson();

  if (model.profileImage != null) {
    files.add(
        FileMultiPart(key: "ProfileImage",
            platformFile: model.profileImage ??
                PlatformFile(
                    name: '',
                    size: 0
                )));
  }

  if (model.license != null) {
    files.add(FileMultiPart(
        key: "License", platformFile: model.license ??
        PlatformFile(
            name: '',
            size: 0
        )));
  }

  if (model.saudiId != null) {
    files.add(FileMultiPart(
        key: "SaudiId", platformFile: model.saudiId ??
        PlatformFile(
            name: '',
            size: 0
        )));
  }

  try {
    var response = await ApiController(
        customAppFlavor.endPoints.driverEndPoints.uploadDriverAttachment,
        RequestTypeEnum.post)
        .sendRequest(body: body, files: files, isMultiPart: true);
    return ResponseDriverStatusModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}




/// Account status
Future<ResponseDriverStatusModel> accountStatusApi() async {
  try {
    var response = await ApiController(
        customAppFlavor.endPoints.driverEndPoints.accountStatus,
        RequestTypeEnum.get)
        .sendRequest();
    return ResponseDriverStatusModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}


/// Driver profile response
Future<ResponseDriverProfileModel> driverProfileResponseApi() async {
  try {
    var response = await ApiController(
        customAppFlavor.endPoints.driverEndPoints.driverProfileResponse,
        RequestTypeEnum.get)
        .sendRequest();
    return ResponseDriverProfileModel.fromJson(response.objectResponse);
  } catch (e) {
    throw e.toString();
  }
}






