
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/vm/providers_vma/read_model_vma.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/driver/BodyUploadDriverAttachmentModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/driver/ResponseDriverStatusModel.dart';
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


}
