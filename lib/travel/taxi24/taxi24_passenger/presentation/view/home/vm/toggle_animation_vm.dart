

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/HomeAnimateModel.dart';



final toggleAnimationProvider = StateNotifierProvider<ToggleAnimationVM, HomeAnimateModel>((ref) {
  return ToggleAnimationVM(HomeAnimateModel());
});

class ToggleAnimationVM extends StateNotifier<HomeAnimateModel> {

  ToggleAnimationVM(HomeAnimateModel state) : super(state);


  void toggleHeaderAnimate(bool header) {
    if(state.header != header){
      state = state.copyWith(
          header: header,
          confirmFooter: state.confirmFooter,);
    }

  }


  void toggleConfirmFooterAnimate(bool confirmFooter) {
    if(state.confirmFooter != confirmFooter){
      state = state.copyWith(
        header: state.header,
        confirmFooter:confirmFooter,
          tripFooter: state.tripFooter);
    }

  }

  void toggleTripFooterAnimate(bool tripFooter) {
    if(state.tripFooter != tripFooter){
      state = state.copyWith(
        header: state.header,
        confirmFooter:state.confirmFooter,
      tripFooter: tripFooter);
    }

  }



}

 