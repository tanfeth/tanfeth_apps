

import 'package:flutter_riverpod/flutter_riverpod.dart';



final selectedCityProvider = StateNotifierProvider<SelectedCityVM, int>((ref) {
  return SelectedCityVM(-1);
});

class SelectedCityVM extends StateNotifier<int> {

  SelectedCityVM(super.state);


  void setSelectedCity(int index) {
    if(state != index){
      state = index;
    }

  }

}