

import 'package:flutter_riverpod/flutter_riverpod.dart';



final selectedGenderProvider = StateNotifierProvider<SelectedGenderVM,
    int>((ref) {
  return SelectedGenderVM(0);
});


class SelectedGenderVM extends StateNotifier<int> {

  SelectedGenderVM(super.state);


  void setSelectedGender(int index) {
    if(state != index){
      state = index;
    }

  }

}