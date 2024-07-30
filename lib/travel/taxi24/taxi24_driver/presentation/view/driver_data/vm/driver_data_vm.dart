
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/vm/providers_vma/read_model_vma.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/car/BodyInsertCarModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/car/BodyUploadCarAttachmentModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/driver/BodyUploadDriverAttachmentModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/driver/ResponseDriverStatusModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/repo/car/car_repo.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/repo/driver/driver_repo.dart';




final taxiDriverDataProvider =
AutoDisposeStateNotifierProvider<TaxiDriverDataVM, ResponseDriverStatusModel?>(
        (ref) {
      ref.keepAlive();
      return TaxiDriverDataVM(ref);
    });



class TaxiDriverDataVM extends ReadNotifierVMA<ResponseDriverStatusModel,
    ResponseDriverStatusModel, ResponseDriverStatusModel?> {
  final AutoDisposeStateNotifierProviderRef ref;

  BodyUploadDriverAttachmentModel bodyUploadDriverAttachmentModel = 
  BodyUploadDriverAttachmentModel();


  BodyUploadCarAttachmentModel bodyUploadCarAttachmentModel =
      BodyUploadCarAttachmentModel();


  BodyInsertCarModel bodyInsertCarModel = BodyInsertCarModel();


  TaxiDriverDataVM(this.ref) : super(null);



  Future<void> uploadDriverAttachment() async {
    var response  = await refresh(
        ref: ref,
        future: uploadDriverAttachmentApi(model: bodyUploadDriverAttachmentModel),
        isOnPress: true);
    if(response != null){
      setModel(response);
    }

  }


  Future<void> getAccountStatus() async {
    var response  = await refresh(
        ref: ref,
        future: accountStatusApi(),
        isOnPress: true);
    if(response != null){
      setModel(response);
    }

  }


  Future<void> uploadCarAttachments() async {
    var response  = await refresh(
        ref: ref,
        future: uploadCarAttachmentsApi(model: bodyUploadCarAttachmentModel),
        isOnPress: true);
    if(response != null){
      setModel(response);
    }

  }


  Future<void> insertCar() async {
    var response  = await refresh(
        ref: ref,
        future: insertCarApi(model: bodyInsertCarModel),
        isOnPress: true);
    if(response != null){
      setModel(response);
    }

  }




  void setDataModel({required PlatformFile file,
   required int driverData}) {

    if(driverData ==
        customAppFlavor.commonEnum.driverDataEnum.personalPic){
      bodyUploadDriverAttachmentModel.profileImage = file;
    }else if(driverData ==
        customAppFlavor.commonEnum.driverDataEnum.saudiID){
      bodyUploadDriverAttachmentModel.saudiId = file;
    }else if(driverData ==
        customAppFlavor.commonEnum.driverDataEnum.drivingLicence){
      bodyUploadDriverAttachmentModel.license = file;
    }else if(driverData ==
        customAppFlavor.commonEnum.driverDataEnum.vehicleRegistration){

    }else if(driverData ==
        customAppFlavor.commonEnum.driverDataEnum.vehicleInsurance){

    }
  }
  
  
}
