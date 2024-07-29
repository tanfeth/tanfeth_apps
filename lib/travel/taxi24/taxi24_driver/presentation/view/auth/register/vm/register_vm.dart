
import 'package:api_controller/vm/providers_vma/read_model_vma.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/BodyRegisterModel.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/ResponseRegisterModel.dart';
import 'package:tanfeth_apps/travel/common/data/repo/auth/auth_repo.dart';




final taxiDriverRegisterProvider =
AutoDisposeStateNotifierProvider<TaxiDriverRegisterVM, ResponseRegisterModel?>(
        (ref) {
          ref.keepAlive();
      return TaxiDriverRegisterVM(ref);
    });



class TaxiDriverRegisterVM extends ReadNotifierVMA<ResponseRegisterModel,
    ResponseRegisterModel, ResponseRegisterModel?> {
  final AutoDisposeStateNotifierProviderRef ref;

  BodyRegisterModel bodyRegisterModel = BodyRegisterModel();

  TaxiDriverRegisterVM(this.ref) : super(null);

  Future<void> userRegisterApi() async {
    var response  = await refresh(
        ref: ref,
        future: registerApi(model: bodyRegisterModel),
        isOnPress: true);
    if(response != null){
      setModel(response);
    }

  }

}
