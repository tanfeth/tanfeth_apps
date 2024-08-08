



import 'package:api_controller/mode/app_mode.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/theme/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/view/onBoard/onBoard_view.dart';
import 'package:tanfeth_apps/common/presentation/widget/social_list.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/init_route.dart';
import 'package:tanfeth_apps/food/feed_me/data/model/more/MoreModel.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/more/widget/more_cell.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/small_divider.dart';

class MoreView extends ConsumerStatefulWidget{
  const MoreView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_MoreView();

}

class _MoreView extends ConsumerState<MoreView>{



  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
          child: ListView.separated(
            itemCount: moreList.length,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context,index){
              return MoreCell(
                moreModel: moreList[index],
                trailingWidget: index == moreList.lastIndexOf(moreList.last)?
                Container(
                  height: 30,
                  width: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Switch(
                      value: ThemeService().theme ==
                          ThemeMode.dark?
                       true:false,
                      activeColor: context.color.onPrimary,
                      activeTrackColor: context.color.primary,
                      onChanged: (val) async {
                        ThemeService().switchTheme();
                        Get.offAllNamed(InitRouting.config().path);
                      },
                    ),
                  ),
                ):const SizedBox.shrink(),
              );
            },
            separatorBuilder: (context,index)=> Column(
              children: [
                10.ph,
                const SmallDivider(),
                10.ph,
              ],
            ),
          ),
        ),

        Column(
          children: [
            Text(
              LangEnum.followUsOnSocialS.tr(),
              style: context.text.bodyLarge,
            ),
            20.ph,
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SocialRow()],
            ).hPadding(30),
          ],
        ),

        60.ph,

      ],
    );
  }



  List<MoreModel> moreList = [
    MoreModel(
      name: LangEnum.createAccount.tr(),
      icon: Images.user,
      onPress: (){},
    ),

    MoreModel(
      name: LangEnum.favorites.tr(),
      icon: Images.fav,
      onPress: (){},
    ),

    MoreModel(
      name: LangEnum.addStore.tr(),
      icon: Images.whatsApp,
      onPress: (){},
    ),


    MoreModel(
      name: LangEnum.complainAndSuggestion.tr(),
      icon: Images.complain,
      onPress: (){},
    ),

    MoreModel(
      name: LangEnum.rateApp.tr(),
      icon: Images.rate,
      onPress: (){},
    ),


    MoreModel(
      name: LangEnum.inviteFriends.tr(),
      icon: Images.share,
      onPress: (){},
    ),


    MoreModel(
      name: LangEnum.termsAndConditions.tr(),
      icon: Images.condition,
      onPress: (){},
    ),

    MoreModel(
      name: LangEnum.darkMode.tr(),
      icon: Images.nightMode,
      onPress: (){
        ThemeService().switchTheme();
        Get.offAllNamed(InitRouting.config().path);
      },
    ),




  ];


}