
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/toggle_animation_vm.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/show_case.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/storage.dart';


class HeaderWidget extends ConsumerStatefulWidget{
  const HeaderWidget({
    super.key,
});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeaderWidget();


}



class _HeaderWidget extends ConsumerState<HeaderWidget>{


  @override
  void initState() {
    if(TaxiPassengerAppStorage.getHomeCase() == true){
      Future.delayed(const Duration(seconds: 1),(){
        showCaseEvent(context: context,caseList: [
          showcaseKey0,
          showcaseKey1,
        ]);
      });

    }
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     vertical: 30,
          //     horizontal: 20
          //   ),
          //   child: FadeInLeft(
          //       animate: animate,
          //       child: Container(
          //         width: 50,
          //         height: 50,
          //         decoration: BoxDecoration(
          //           color: context.color.primary.withOpacity(0.5),
          //           shape: BoxShape.circle,
          //         ),
          //         child: Center(
          //           child: Icon(
          //             Icons.share,
          //             color: context.color.onPrimary,
          //           ),
          //         ),
          //       ) ),
          // ),

          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 20
            ),
            child: InkWell(
              onTap: (){
                Scaffold.of(context).openDrawer();
              },
              child: Showcase(
                key: showcaseKey0,
                description: LangEnum.menuOption.tr(),
                child: FadeInRight(
                  animate: ref.watch(toggleAnimationProvider).header??false,
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: context.color.primary.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.menu,
                          color: context.color.onPrimary,
                        ),
                      ),
                    ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

}