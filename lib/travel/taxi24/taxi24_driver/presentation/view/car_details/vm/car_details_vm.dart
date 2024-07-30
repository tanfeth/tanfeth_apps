

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


  void setDataModel({
    String? carType,
    String? carModel,
    String? carYearModel,
    String? carSeatType,
    bool? isDisable,
    String?  plateNumber,
    String?  plateLetterRight,
    String?  plateLetterMiddle,
    String?  plateLetterLeft,
    String?  sequenceNumber,
    String?  color
    }) {

    state = state.copyWith(
        carType:carType??state.carType,
        carModel: carModel??state.carModel,
      carYearModel:carYearModel??state.carYearModel,
      carSeatType: carSeatType??state.carSeatType,
      isDisable:isDisable??state.isDisable,
      plateNumber: plateNumber??state.plateNumber,
      plateLetterRight:plateLetterRight??state.plateLetterRight,
      plateLetterMiddle: plateLetterMiddle??state.plateLetterMiddle,
      plateLetterLeft:plateLetterLeft??state.plateLetterLeft,
      sequenceNumber: sequenceNumber??state.sequenceNumber,
      color:carType??state.color,
    );

  }

}