

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';

final selectedPaymentMethodProvider = StateNotifierProvider<SelectedPaymentMethodVM, String>((ref) {
  return SelectedPaymentMethodVM(
      customAppFlavor.commonEnum.paymentMethodEnum.bankTransfer
  );
});

class SelectedPaymentMethodVM extends StateNotifier<String> {

  SelectedPaymentMethodVM(String state) : super(state);


  void setPayment(String payment) {
    if(state != payment){
      state = payment;
    }

  }

}
