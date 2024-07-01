import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/vm/selected_payment_method_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/complete_trip/widget/payment_cell.dart';


class PaymentMethodsWidget extends ConsumerStatefulWidget {
  const PaymentMethodsWidget();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentMethodsWidget();

}

class _PaymentMethodsWidget extends ConsumerState<PaymentMethodsWidget>{

  late SelectedPaymentMethodVM selectedPaymentMethodVM;
  late String selectedPayment ;
  bool walletSwitch = true;


  initBuild(){
    selectedPaymentMethodVM = ref.watch(selectedPaymentMethodProvider.notifier);
    selectedPayment = ref.watch(selectedPaymentMethodProvider);
  }


  @override
  Widget build(BuildContext context) {
    initBuild();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          LangEnum.paymentMethod.tr(),
          style: context.text.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color:context.color.primary
          ),
        ),
        10.ph,

        ///Wallet
        PaymentCell(
          showCheckButton: false,
          image: Images.bank,
          title: LangEnum.wallet.tr(),
          isSelected:
          selectedPayment ==
              customAppFlavor.commonEnum.paymentMethodEnum.bankTransfer,
          onTap: () {
            selectedPaymentMethodVM.setPayment(
                customAppFlavor.commonEnum.paymentMethodEnum.bankTransfer
            );
          },
          trailing: SizedBox(
            height: 35,
            width: 50,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Switch(
                value: walletSwitch,
                activeColor: context.color.onPrimary,
                activeTrackColor: context.color.primary,
                onChanged: (val) async {
                  walletSwitch = val;
                  setState(() {});
                },
              ),
            ),
          ),
        ),
        5.ph,

        PaymentCell(
          image: Images.bank,
          title: LangEnum.onlinePayment.tr(),
          isSelected:
          selectedPayment ==
              customAppFlavor.commonEnum.paymentMethodEnum.bankTransfer,
          onTap: () {
            selectedPaymentMethodVM.setPayment(
                customAppFlavor.commonEnum.paymentMethodEnum.bankTransfer
            );
          },
        ),
        5.ph,


        InkWell(
          onTap: (){
            selectedPaymentMethodVM.setPayment(
                customAppFlavor.commonEnum.paymentMethodEnum.visa
            );

           // Get.toNamed(MyCardsRouting.config().path);
          },
          child: PaymentCell(
            image: Images.visa,
            title: LangEnum.visa.tr(),
            isSelected:
            selectedPayment ==
                customAppFlavor.commonEnum.paymentMethodEnum.visa,
            onTap: () {
              selectedPaymentMethodVM.setPayment(
                  customAppFlavor.commonEnum.paymentMethodEnum.visa
              );

             // Get.toNamed(MyCardsRouting.config().path);
            },
            trailing: Expanded(
              child: Padding(
                padding:EdgeInsets.only(top: 10,
                right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          '**** **** 1234',
                          style: context.text.bodyLarge,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    5.pw,
                    Image.asset(
                      Images.visa,
                    width: 30,)
                  ],
                ),
              ),
            ),
          ),
        ),

        5.ph,
        PaymentCell(
          image: Images.cash,
          title: LangEnum.cash.tr(),
          isSelected:
          selectedPayment ==
              customAppFlavor.commonEnum.paymentMethodEnum.cash,
          onTap: () {
            selectedPaymentMethodVM.setPayment(
                customAppFlavor.commonEnum.paymentMethodEnum.cash
            );
          },
        ),

      ],
    );
  }

}
