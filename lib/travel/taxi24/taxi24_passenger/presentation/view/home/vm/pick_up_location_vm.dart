

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/vm/providers_vma/read_model_vma.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/LocationModel.dart';

final pickUpLocationProvider = StateNotifierProvider.autoDispose<
    PickUpLocationVM, LocationModel>((ref) {
  ref.keepAlive();
  return PickUpLocationVM(ref);
});

class PickUpLocationVM extends ReadNotifierVMA<LocationModel,
    LocationModel, LocationModel> {
  final AutoDisposeStateNotifierProviderRef ref;

  PickUpLocationVM(this.ref, {LocationModel? locationModel})
      : super(locationModel ?? LocationModel());


  @override
  void setModel(LocationModel model) {
    state = model;
  }



}
