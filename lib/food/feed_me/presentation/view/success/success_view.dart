


import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/layout_route.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/vm/bottom_bar_vm.dart';

class FeedMeSuccessView extends ConsumerStatefulWidget{
  const FeedMeSuccessView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_FeedMeSuccessView();


}

class _FeedMeSuccessView extends ConsumerState<FeedMeSuccessView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.sucess,
                        height: 80,
                        width: 80,
                      ),

                      20.ph,

                      Text(
                        LangEnum.successfullyOrdered.tr(),
                        style: context.text.titleMedium,
                      ),

                      10.ph,
                      Text(
                        LangEnum.successfullyOrderedDes.tr(),
                        style: context.text.titleMedium,
                      ),


                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: () async {
                    ref.watch(feedMeBottomBarProvider.notifier)
                        .changePageIndex(currentIndex: 0);
                    Get.offNamed(LayoutRouting.config().path);
                  },
                  child: Text(LangEnum.continueWord.tr()),
                ),

                25.ph,

              ],
            ),
          ),
        ),
      ),
    );
  }

}