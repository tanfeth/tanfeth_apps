

import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';

class ClientsRateView extends ConsumerStatefulWidget{
  const ClientsRateView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_ClientsRateView();


}

class _ClientsRateView extends ConsumerState<ClientsRateView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.clientRate.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10
            ),
              itemBuilder: (context,index){
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(width: 1,
                    color: context.color.primary)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [

                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(Images.user),
                                        fit: BoxFit.fill
                                    ),
                                  ),
                                ),

                                10.pw,
                                Text(
                                  'عبدالرحمن مبارك',
                                  style: context.text.bodyLarge,
                                )
                              ],
                            ),
                          ),


                          Row(
                            children: [

                              ...List.generate(
                                  5,
                                      (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    child: Icon(
                                      Icons.star,
                                      size: 15,
                                      color: context.color.secondary,
                                    ),
                                  )),

                            ],
                          )
                        ],
                      ),




                      10.ph,
                      const Text(
                        'طعم ما له مثيل وتعامل محترم وتوصيل ممتاز'
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => 10.ph,
              itemCount: 20
          ),
        ),
      ),
    );
  }

}