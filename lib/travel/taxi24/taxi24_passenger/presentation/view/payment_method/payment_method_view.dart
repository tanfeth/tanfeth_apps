
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/payment_method/widget/payment_build_method.dart';

class TaxiPassengerPaymentMethodView extends ConsumerStatefulWidget{
  const TaxiPassengerPaymentMethodView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _TaxiPassengerPaymentMethodView();
  
}

class _TaxiPassengerPaymentMethodView extends ConsumerState<TaxiPassengerPaymentMethodView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.paymentMethod.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LangEnum.paymentMethod.tr(),
                  style: context.text.titleMedium,
                ),
     
                SizedBox(
                  height: 24,
                ),
                //
                // PaymentBuildMethod(
                //     icon: Images.walletSVG,
                //     title:LangEnum.wallet.tr(),
                //     svgHeight: 18,
                //     color: context.color.onSurface,
                //     trailing: Switch.adaptive(
                //       value: viewModel.openWallet,
                //       onChanged: (value) {
                //         viewModel.openCloseWallet();
                //       },
                //       activeTrackColor: context.color.onSurface,
                //       activeColor: context.color.primary,
                //     )),
                // GestureDetector(
                //   onTap: (){
                //
                //   },
                //   child: PaymentBuildMethod(
                //       icon: Images.cashSVG,
                //       title: "Cash".tr(),
                //       svgHeight: 16,
                //       color: ColorsManager.greenColor,
                //       trailing: Container(
                //         height: 20,
                //         width: 20,
                //         decoration: viewModel.selectPayment!=0?
                //         BoxDecoration(
                //             borderRadius: BorderRadius.circular(16.r),
                //             border: Border.all(color: ColorsManager.dividerColor,width: 2.w)
                //         ):BoxDecoration(
                //             color: ColorsManager.blackColor,
                //             borderRadius: BorderRadius.circular(16.r),
                //             border: Border.all(color: ColorsManager.baseOrange,width: 6)
                //         ),)),
                // ),
                // SizedBox(height: 24,),
                //
                //
                // SizedBox(
                //   child: ListView.separated(
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemCount: viewModel.cardList.length+1,
                //     itemBuilder: (context, index) {
                //       return  index !=viewModel.cardList.length ?
                //       GestureDetector(
                //         onTap: (){
                //           },
                //         child: CreditCard(
                //           card: viewModel.cardList[index],
                //           isSelect: true,
                //           select: getIt<TripViewModel>().selectPayment==index+1? true : false,
                //         ),
                //       ):
                //       GestureDetector(
                //         onTap: () {
                //           Navigator.pushNamed(context,
                //               RoutePath.cardWebViewScreen);
                //         },
                //         child: Row(
                //           children: [
                //             Icon(Icons.add, size: 24,),
                //             SizedBox(width: 16,),
                //             Text(
                //               LangEnum.addCreditDebitCard.tr(),
                //               textAlign: TextAlign.center,
                //             ),
                //           ],
                //         ),
                //       );
                //     },
                //     separatorBuilder: (BuildContext context, int index) {
                //       return SizedBox(height: 40,);
                //     },
                //   ),
                // ),
                //
                //
                // GestureDetector(
                //   onTap: ()=>Navigator.pushNamed(context,
                //       RoutePath.cardWebViewScreen),
                //   child: PaymentBuildMethod(
                //       icon: Images.cardSVG,
                //       title: LangEnum.addCreditDebitCard.tr(),
                //       "Add credit/debit card".tr(),
                //       svgHeight: 16,
                //       color: context.color.onSurface,
                //       trailing: const SizedBox.shrink()),
                // ),
                //
                //
                // SizedBox(height: 14,),
                // Center(
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.pop(context);
                //     },
                //     child: Center(
                //       child: CustomText(
                //         text: "Close".tr(),
                //         fontSize: FontSizer.s18,
                //         fontWeight: FontWeightManager.large,
                //       ),
                //     ),
                //   ),
                // ),
                
                
               
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}