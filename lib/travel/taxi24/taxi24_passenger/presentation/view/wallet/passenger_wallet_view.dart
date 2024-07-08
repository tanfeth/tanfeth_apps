  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/profile_item.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/add_funds_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/my_cards_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/transaction_route.dart';

class PassengerWalletView extends StatefulWidget {
    const PassengerWalletView({super.key});
    @override
    State<PassengerWalletView> createState() => _PassengerWalletViewState();
  }
  class _PassengerWalletViewState extends State<PassengerWalletView> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: MainAppBar(title: LangEnum.wallet.tr(),),
        body: WebWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: (24,16).toSymmetric,
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      padding: 24.toHorizontal,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              context.color.primary.withOpacity(0.9),
                              context.color.primary.withOpacity(0.6),
                            ]),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("0.00 ريال",style: context.text.headlineLarge?.copyWith(fontWeight: FontWeight.w700),),
                              8.ph,
                              Text(LangEnum.currentBalance.tr(),style: context.text.bodyLarge,),
                            ],
                          ),
                          GestureDetector(
                            onTap:() {
                              Get.toNamed(AddFundsRouting.config().path);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: context.color.onSurface,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Icon(Icons.add, size: 24,color: context.color.surface,),
                            ),
                          )
                        ],
                      ),
                    ),
                    30.ph,
                    ProfileCell(
                        height:30 ,
                        title: LangEnum.transactions.tr(),
                        iconHeight: 24,
                        iconWidth: 24,
                        icon: Images.recentClock,
                        function: () {
                          Get.toNamed(TransactionRouting.config().path);
                        }),
                    20.ph,
                    ProfileCell(
                        height:30,
                        title: LangEnum.myCards.tr(),
                        iconHeight: 16,
                        iconWidth: 16,
                        icon: Images.cardSVG,
                        function: () {
                          Get.toNamed(MyCardsRouting.config().path);
                        })
                  ],
                ),
              ),

            ],
          ),
        ),
      );
    }
  }
