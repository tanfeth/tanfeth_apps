import 'package:flutter_riverpod/flutter_riverpod.dart';



final layoutProvider = StateNotifierProvider<LayoutVM, int>((ref) {
  return LayoutVM(1);
});

class LayoutVM extends StateNotifier<int> {

  LayoutVM(int state) : super(state);


  void changeCurrentIndex(int index) {
    state = index;
  }

}