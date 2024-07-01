

import 'package:flutter_riverpod/flutter_riverpod.dart';

final carTypeProvider = StateNotifierProvider<CarTypeVM, int>((ref) {
  return CarTypeVM(0);
});

class CarTypeVM extends StateNotifier<int> {

  CarTypeVM(int state) : super(state);


  void changeIndex(int index) {
    state = index;
  }

}