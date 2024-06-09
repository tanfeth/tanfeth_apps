import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/CardModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_istimara/widget/credit_card.dart';

class CardView extends ConsumerStatefulWidget {
  const CardView({super.key});

  @override
  ConsumerState<CardView> createState() => _CardViewState();
}

class _CardViewState extends ConsumerState<CardView> {
  late List<CardModel> cardList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: cardList.isNotEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView.separated(
                  itemCount: cardList.length + 1,
                  itemBuilder: (context, index) {
                    return index != cardList.length
                        ? CreditCard(
                            cardModel: cardList[index],
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
                                  textAlign: TextAlign.start,
                                  style: context.text.bodyLarge?.copyWith(
                                      color: context.color.onSurface),
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
              )
            : Row(
                children: [
                  Center(
                      child: SvgPicture.asset(
                    Images.cardSVG,
                    height: 14,
                    width: 20,
                  )),
                  SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LangEnum.addCreditDebitCard.tr(),
                          textAlign: TextAlign.start,
                          style: context.text.bodyLarge
                              ?.copyWith(color: context.color.onSurface),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(LangEnum.usedReceiveMoney.tr(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: context.color.surfaceContainerHighest)),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        // Navigator.pushNamed(context,
                        //   RoutePath.cardWebViewScreen,);
                      },
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: context.color.surfaceContainerHighest,
                                  width: 2),
                              borderRadius: BorderRadius.circular(24)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.add,
                                size: 20,
                                color: context.color.onSurface,
                              ),
                              5.pw,
                              Text(
                                LangEnum.add.tr(),
                                style: context.text.titleMedium
                                    ?.copyWith(color: context.color.onSurface),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ));
  }
}
