
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/vm/providers_vma/read_model_vma.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/BodyLoginModel.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/ResponseLoginModel.dart';
import 'package:tanfeth_apps/travel/common/data/repo/auth/auth_repo.dart';




final taxiLoginProvider =
AutoDisposeStateNotifierProvider<TaxiLoginVM, ResponseLoginModel?>(
        (ref) {
      return TaxiLoginVM(ref);
    });



class TaxiLoginVM extends ReadNotifierVMA<ResponseLoginModel,
    ResponseLoginModel, ResponseLoginModel?> {
  final AutoDisposeStateNotifierProviderRef ref;

  BodyLoginModel bodyLoginModel = BodyLoginModel();

  TaxiLoginVM(this.ref) : super(null);

  Future<void> userLoginApi() async {
    await refresh(
        ref: ref,
        future: loginApi(model: bodyLoginModel),
        isOnPress: true);
  }

}
