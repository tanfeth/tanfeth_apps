
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/vm/selected_payment_method_vm.dart';


String getPaymentName({required WidgetRef ref}) {
  if(ref.watch(selectedPaymentMethodProvider) ==
      customAppFlavor.commonEnum.paymentMethodEnum.bankTransfer){
    return LangEnum.onlinePayment.tr();
  }else if(ref.watch(selectedPaymentMethodProvider) ==
      customAppFlavor.commonEnum.paymentMethodEnum.visa){
    return LangEnum.visa.tr();
  }else {
    return LangEnum.cash.tr();
  }
}

String getPaymentImage({required WidgetRef ref}) {
  if(ref.watch(selectedPaymentMethodProvider) ==
      customAppFlavor.commonEnum.paymentMethodEnum.bankTransfer){
    return Images.bank;
  }else if(ref.watch(selectedPaymentMethodProvider) ==
      customAppFlavor.commonEnum.paymentMethodEnum.visa){
    return Images.visa;
  }else {
    return Images.cash;
  }
}
