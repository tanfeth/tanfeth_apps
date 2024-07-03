import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/my_cards/widget/card_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/my_cards/widget/empty_card.dart';

class MyCards extends StatefulWidget {
  const MyCards({super.key});

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {

  List card=[
    {
      "id":1,
      "brand":"visa",
      "isDefault":true,
      "cardNumber":"**** **** **** 1234",
    },
    {
      "id":2,
      "brand":"master",
      "isDefault":false,
      "cardNumber":"**** **** **** 1234",
    },
    {
      "id":3,
      "brand":"master",
      "isDefault":false,
      "cardNumber":"**** **** **** 1234",
    },
    {
      "id":4,
      "brand":"visa",
      "isDefault":false,
      "cardNumber":"**** **** **** 1234",
    }
  ];

  void onCheckBoxChanged(bool newValue, int index) {
    if (!newValue) return;
    setState(() {
      for (int i = 0; i < card.length; i++) {
        card[i]['isDefault'] = (i == index) ? newValue : false;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return WebWidth(
      child: Scaffold(
        appBar: MainAppBar(title: LangEnum.myCards.tr(),leadingWidget: BackButtonWidget()),
        body: SafeArea(
          child: Padding(padding: (24,16).toSymmetric,
            child:card.isNotEmpty? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(LangEnum.myCards.tr(),style: context.text.titleMedium?.
                copyWith(fontWeight: FontWeight.w700),),
                16.ph,
                Expanded(
                  child: ListView.separated(
                    itemCount:card.length,
                    itemBuilder: (_,index)=> CreditCard(
                      card: card[index],
                      onCheckBoxChanged: onCheckBoxChanged,
                      index: index
                    ),
                    separatorBuilder: (BuildContext context, int index)=>12.ph,
                  ),
                ),
              ],
            ):EmptyCard(),
          ),
        ),
      ),


    );
  }
}
