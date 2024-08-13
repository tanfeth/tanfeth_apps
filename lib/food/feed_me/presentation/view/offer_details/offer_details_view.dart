

import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/food/common/shared/routes/restaurant_profile_route.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/offer_details/offer_details_header_widget.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';

class OfferDetailsView extends ConsumerStatefulWidget{
  const OfferDetailsView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_OfferDetailsView();

}

class _OfferDetailsView extends ConsumerState<OfferDetailsView>{

  String bodyText =
      '#سماش برجر بقى موجود معانا #اونلاين 😍'
  'على ابلكيشن اكلنى♥️'
  'برجر - بطاطس-صوصات - بقاله - '
  'كل اللى عايزه هتلاقيه 😉😉'
"  اطلب #اونلاين من الابلكيشن 📱 و هيرجعلك فلوس"
  'كاش باك لرصيدك في المحفظه على الابلكيشن 💵💰'
 ' تطلب بيهم بعد كده 😉 وكمان تقدر تدفع بفيزا 💳'
 " او فودافون كاش او اي محفظة 🤩 تيك اواي & دليفيري"
  "وبنوصل كمان لاي مكان داخل و خارج #الممكلة 😉"
  ;


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: MainAppBar(
        title: 'سماش برجر',
        leadingWidget: const BackButtonWidget(),
        appBarColor: context.color.primary,
        trailingWidget: InkWell(
          splashColor: context.color.surface,
          onTap: (){
            shareLink(link: 'https://www.google.co.uk/');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.share,
              size: 25,
                color: context.color.onPrimary,
            ),
          ),
        ),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.ph,
                      const OfferDetailsHeaderWidget(),

                      20.ph,

                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20
                        ),
                        padding:const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3
                        ),
                        decoration: BoxDecoration(
                            color: context.color.primary,
                            borderRadius: const BorderRadius.all(Radius.circular(10))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            'ينتهى بعد 5 ايام',
                            textAlign: TextAlign.center,
                            style: context.text.bodyLarge?.copyWith(
                                color: context.color.onPrimary
                            ),
                          ),
                        ),
                      ),

                      20.ph,
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          bodyText,
                          style: const TextStyle(
                            height: 2
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () async {
                    Get.toNamed(RestaurantProfileRouting.config().path);
                  },
                  child: Text(LangEnum.follow.tr()),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}