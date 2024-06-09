
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/payment_method_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/wallet_cash_Out_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/verify/widget/back_button_widget.dart';

class WalletView extends ConsumerStatefulWidget{
  const WalletView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WalletView();

}

class _WalletView extends ConsumerState<WalletView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.wallet.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24,
            vertical: 10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding:  EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient:  LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            context.color.primary,
                            context.color.primary.withOpacity(0.3),
                          ])),
                  child:Column(
                    crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      SizedBox(height: 22,),
                      Text(
                        "${LangEnum.sar.tr()} 100.00",
                        style: context.text.titleMedium,
                      ),
                      SizedBox(height: 8,),
                      Text(
                        LangEnum.availableBalance.tr(),
                        style: TextStyle(
                          color: context.color.onSurface
                        ),
                      ),

                      SizedBox(height: 24,),

                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: 100.00 <50.0 ? (){}: (){
                          if((-1).isNegative){
                            Get.toNamed(WalletCashOutRouting.config().path);
                          }
                        },
                        child: Container(
                          height: 48,
                          width: 109,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color:0.00.isNegative?
                            context.color.onSurface:
                            (0.00)<50.0?
                            context.color.surface:
                            context.color.onSurface,
                          ),
                          child: Text(
                              0.00.isNegative?
                              LangEnum.payTaxi.tr():
                              LangEnum.cashOut.tr()
                          )
                        ),
                      ),
                      
                      
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Images.accsMarkSVG,
                              height: 20,width: 20,
                            colorFilter: ColorFilter.mode(
                                context.color.onSurface,
                                BlendMode.srcIn),
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child:Text(
                                LangEnum.minimumBalanceRequestCash.tr(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: context.color.onSurface
                                ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 28,),
                    ],
                  ),
                ),
                SizedBox(height: 26,),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    Get.toNamed(PaymentMethodRouting.config().path);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Images.cardSVG,
                                width: 20,height: 14
                            ),
                            SizedBox(width: 18,),
                            Text(
                              LangEnum.paymentMethod.tr(),
                              style: TextStyle(
                                color: context.color.onSurface
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,size: 16,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}