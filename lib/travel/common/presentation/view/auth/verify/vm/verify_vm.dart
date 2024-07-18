


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/vm/providers_vma/read_model_vma.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/BodyVerifyModel.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/ResponseVerifyModel.dart';
import 'package:tanfeth_apps/travel/common/data/repo/auth/auth_repo.dart';




final verifyProvider =
AutoDisposeStateNotifierProvider<VerifyVM, ResponseVerifyModel?>(
        (ref) {
          ref.keepAlive();
      return VerifyVM(ref);
    });



class VerifyVM extends ReadNotifierVMA<ResponseVerifyModel,
    ResponseVerifyModel, ResponseVerifyModel?> {
  final AutoDisposeStateNotifierProviderRef ref;

  BodyVerifyModel bodyVerifyModel = BodyVerifyModel();

  VerifyVM(this.ref) : super(null);

  Future<void> userVerifyApi() async {
    await refresh(
        ref: ref,
        future: verifyApi(model: bodyVerifyModel),
        isOnPress: true);
  }

}
