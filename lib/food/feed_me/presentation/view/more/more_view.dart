



import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:api_controller/shared/theme/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/social_list.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/complain_and_suggest_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/favourite_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/auth_routing/register_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/init_route.dart';
import 'package:tanfeth_apps/food/common/shared/routes/address_list_route.dart';
import 'package:tanfeth_apps/food/feed_me/data/model/more/MoreModel.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/more/widget/more_cell.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/terms_service_route.dart';
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
            itemCount: userList.length +1,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context,index){
              if(index == (userList.length )){
                return         Column(
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
                );
              }else {
                return MoreCell(
                  moreModel: userList[index],
                  trailingWidget: index == userList.lastIndexOf(userList.last)?
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
              }

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


        30.ph
      ],
    );
  }



  List<MoreModel> userList = [
    MoreModel(
      name: LangEnum.createAccount.tr(),
      icon: Images.user,
      onPress: (){
        Get.toNamed(RegisterRouting.config().path);
      },
    ),

    MoreModel(
      name: LangEnum.addresses.tr(),
      icon: Images.address,
      onPress: (){
        Get.toNamed(AddressListRouting.config().path);
      },
    ),



    MoreModel(
      name: LangEnum.favorites.tr(),
      icon: Images.fav,
      onPress: (){
        Get.toNamed(FavouriteRouting.config().path);
      },
    ),

    MoreModel(
      name: LangEnum.addStore.tr(),
      icon: Images.whatsApp,
      onPress: (){
        openWhatsapp(whatsNumber: '966544646113');
      },
    ),


    MoreModel(
      name: LangEnum.complainAndSuggestion.tr(),
      icon: Images.complain,
      onPress: (){
        openWhatsapp(whatsNumber: '966544646113');
        // Get.toNamed(ComplainAndSuggestRouting.config().path);
      },
    ),

    MoreModel(
      name: LangEnum.rateApp.tr(),
      icon: Images.rate,
      onPress: (){
        rateAppOnStore();
      },
    ),


    MoreModel(
      name: LangEnum.inviteFriends.tr(),
      icon: Images.share,
      onPress: (){
        shareApp();
      },
    ),


    MoreModel(
      name: LangEnum.termsAndConditions.tr(),
      icon: Images.condition,
      onPress: (){
        Get.toNamed(TermsOfServiceRouting.config().path);
      },
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

  List<MoreModel> guestList = [
    MoreModel(
      name: LangEnum.createAccount.tr(),
      icon: Images.user,
      onPress: (){
        Get.toNamed(RegisterRouting.config().path);
      },
    ),

    MoreModel(
      name: LangEnum.addStore.tr(),
      icon: Images.whatsApp,
      onPress: (){
        openWhatsapp(whatsNumber: '966544646113');
      },
    ),


    MoreModel(
      name: LangEnum.complainAndSuggestion.tr(),
      icon: Images.complain,
      onPress: (){
        openWhatsapp(whatsNumber: '966544646113');
        // Get.toNamed(ComplainAndSuggestRouting.config().path);
      },
    ),

    MoreModel(
      name: LangEnum.rateApp.tr(),
      icon: Images.rate,
      onPress: (){
        rateAppOnStore();
      },
    ),


    MoreModel(
      name: LangEnum.inviteFriends.tr(),
      icon: Images.share,
      onPress: (){
        shareApp();
      },
    ),


    MoreModel(
      name: LangEnum.termsAndConditions.tr(),
      icon: Images.condition,
      onPress: (){
        Get.toNamed(TermsOfServiceRouting.config().path);
      },
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