
import 'package:flutter_riverpod/flutter_riverpod.dart';

final verifyProvider = StateNotifierProvider<VerifyVM, bool>((ref) {
  return VerifyVM(false);
});

class VerifyVM extends StateNotifier<bool> {

  VerifyVM(bool state) : super(state);


  void updateTimer({bool? currentStatus}) async {
    state = currentStatus??false;
  }
}