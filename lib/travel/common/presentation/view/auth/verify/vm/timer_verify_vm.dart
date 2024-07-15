
import 'package:flutter_riverpod/flutter_riverpod.dart';




final timerVerifyProvider = StateNotifierProvider<TimerVerifyVM, bool>((ref) {
  return TimerVerifyVM(false);
});

class TimerVerifyVM extends StateNotifier<bool> {

  TimerVerifyVM(super.state);


  void updateTimer({bool? currentStatus}) async {
    state = currentStatus??false;
  }
}