

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/vm/providers_vma/read_model_vma.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/ParamCarDetailsModel.dart';



final carDetailsProvider =
StateNotifierProvider.autoDispose<CarDetailsVM, ParamCarDetailsModel>((ref) {
  ref.keepAlive();
  return CarDetailsVM(ref);
});


class CarDetailsVM extends
ReadNotifierVMA<ParamCarDetailsModel, ParamCarDetailsModel, ParamCarDetailsModel> {
  final AutoDisposeStateNotifierProviderRef ref;

  CarDetailsVM(this.ref, {ParamCarDetailsModel? state})
      : super(state ?? ParamCarDetailsModel());


}