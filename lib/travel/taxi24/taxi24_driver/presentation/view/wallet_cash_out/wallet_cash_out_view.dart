import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/CardModel.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_istimara/widget/credit_card.dart';

class WalletCashOutView extends ConsumerStatefulWidget {
  const WalletCashOutView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WalletBottomSheetContent();
}

class _WalletBottomSheetContent
    extends ConsumerState<WalletCashOutView> {
  late List<CardModel> cardList = [];

  @override
  void initState() {
    CardModel cardModel = CardModel();
    for (int i = 0; i < 2; i++) {
      cardModel.id = i;
      cardModel.name = '$i cardModel';
      cardModel.cardBrand = Images.appLogoSVG;
      cardList.add(cardModel);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.cashOut.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.ph,
                Text(
                  LangEnum.choosePaymentMethod.tr(),
                  textAlign: TextAlign.start,
                  style: context.text.titleMedium
                      ?.copyWith(color: context.color.onSurface),
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: cardList.length + 1,
                    itemBuilder: (context, index) {
                      return index != cardList.length
                          ? GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {},
                              child: CreditCard(
                                cardModel: cardList[index],
                                isSelect: true,
                              ),
                            )
                          : GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                // Navigator.pushNamed(context,
                                //     RoutePath.cardWebViewScreen);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    LangEnum.addCreditDebitCard.tr(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: context.color.onSurface),
                                  ),
                                ],
                              ),
                            );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 40,
                      );
                    },
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
