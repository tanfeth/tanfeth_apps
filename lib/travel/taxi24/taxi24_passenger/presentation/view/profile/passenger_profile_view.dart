
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/notification_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/send_message_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/web_view_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/welcome_route.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/app_version.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/language_bottom_sheet.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/log_out_bottom_sheet_content.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/profile_item.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/favorite_place_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/my_trip_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/personal_info_route.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/small_divider.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/profile/widget/passenger_profile_data_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/show_case.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/storage.dart';


class TaxiPassengerProfileView extends ConsumerStatefulWidget {
  const TaxiPassengerProfileView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaxiDriverProfile();
}

class _TaxiDriverProfile extends ConsumerState<TaxiPassengerProfileView> {



  @override
  void initState() {
    if(TaxiPassengerAppStorage.getProfileCase() == true){
      showCaseEvent(context: context,caseList: [
        showcaseKey9,
        showcaseKey10,
        showcaseKey11,
        showcaseKey12,
        showcaseKey13
      ]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: LangEnum.profile.tr(),
      leadingWidget: BackButtonWidget(
        onTap: (){
          Scaffold.of(context).closeDrawer();
        },
      ),),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PassengerProfileDataWidget(),
                  40.ph,
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          /// Person info
                          Showcase(
                            key: showcaseKey9,
                            description: LangEnum.personInfoHint.tr(),
                            child: ProfileCell(
                                title: LangEnum.editProfile.tr(),
                                icon: Images.personInfoSVG,
                                function: () {
                                  Scaffold.of(context).closeDrawer();
                                  Get.toNamed(PersonalInfoRouting.config().path);
                                }),
                          ),
                          const SmallDivider(),
                          /// My trip
                          Showcase(
                            key: showcaseKey10,
                            description: LangEnum.myTripHint.tr(),
                            child: ProfileCell(
                                title: LangEnum.myTrips.tr(),
                                icon: Images.fullClockSVG,
                                function: () {
                                  Scaffold.of(context).closeDrawer();
                                  Get.toNamed( MyTripRouting.config().path);
                                  //Get.toNamed(EarningRouting.config().path);
                                  Get.toNamed(MyTripRouting.config().path);
                                }),
                          ),
                           const SmallDivider(),
                          /// Favourite place
                          Showcase(
                            key: showcaseKey11,
                            description: LangEnum.favouritePlaceHint.tr(),
                            child: ProfileCell(
                                title: LangEnum.favourite.tr(),
                                icon: Images.locationSVG,
                                function: () {
                                  Get.toNamed(FavoritePlaceRouting.config().path);
                                  Scaffold.of(context).closeDrawer();
                                 // Get.toNamed(WalletRouting.config().path);
                                }),
                          ),
                           const SmallDivider(),
                          /// Notification
                          ProfileCell(
                              title: LangEnum.notifications.tr(),
                              icon: Images.alertSVG,
                              function: () {
                                Scaffold.of(context).closeDrawer();
                                Get.toNamed(NotificationsRouting.config().path);
                              }),
                           const SmallDivider(),
                          /// Language
                          ProfileCell(
                              title: LangEnum.language.tr(),
                              icon: Images.languageSVG,
                              function: () {
                                Scaffold.of(context).closeDrawer();
                                showBottomSheetFunction(
                                content: const LangBottomSheet(),
                              );
                              }),
                           const SmallDivider(),
                          /// Help
                          ProfileCell(
                              title: LangEnum.help.tr(),
                              icon: Images.helpSVG,
                              function: () {
                                Scaffold.of(context).closeDrawer();
                                Get.toNamed(SendMessageRouting.config().path);
                              }),
                           const SmallDivider(),
                          /// Terms And Conditions
                          ProfileCell(
                              title: LangEnum.termsAndConditions.tr(),
                              icon: Images.aboutProfileSVG,
                              function: () {
                                Get.toNamed(
                                  WebViewRouting.config().path,
                                  parameters: {
                                    WebViewRouting.pageUrl:
                                    customAppFlavor.commonEnum.appDataEnum.termsAndCondition+ ref.watch(languageProvider),
                                    WebViewRouting.appBarTitle:
                                    LangEnum.termsAndConditions.tr(),
                                  });
                              }),
                           const SmallDivider(),
                          /// Rate app
                          Showcase(
                            key: showcaseKey12,
                            description: LangEnum.rateAppOption.tr(),
                            child: ProfileCell(
                                title: LangEnum.rateApp.tr(),
                                icon: Images.starSVG,
                                imageWidget: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                                  child: Image.asset(
                                    Images.startGif,
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                                function: () {
                                  Scaffold.of(context).closeDrawer();
                                  rateAppOnStore();
                                }),
                          ),
                           const SmallDivider(),
                          ///Share app
                          Showcase(
                            key:showcaseKey13,
                            description: LangEnum.shareOption.tr(),
                            onBarrierClick: ()async{
                             await  TaxiPassengerAppStorage.showProfileCase(false);
                            },
                            onToolTipClick: ()async{
                              await  TaxiPassengerAppStorage.showProfileCase(false);
                            },
                            onTargetClick: ()async{
                              await  TaxiPassengerAppStorage.showProfileCase(false);
                            },
                            disposeOnTap: true,
                            child: ProfileCell(
                                title: LangEnum.shareApp.tr(),
                                imageWidget: Image.asset(
                                  Images.shareGif,
                                  height: 25,
                                  width: 25,
                                ).hPadding(8),
                                function: () {
                                  Scaffold.of(context).closeDrawer();
                                  shareApp();
                                }),
                          ),
                           const SmallDivider(),
                          /// Become  a captain
                          ProfileCell(
                              title: LangEnum.becomeCaptain.tr(),
                              icon: Images.becomeCaptainSVG,
                              function: () {
                                Scaffold.of(context).closeDrawer();
                                Get.toNamed(
                                  WebViewRouting.config().path,
                                  parameters: {
                                    WebViewRouting.pageUrl:
                                    customAppFlavor.commonEnum.appDataEnum.termsAndCondition+ref.watch(languageProvider),
                                    WebViewRouting.appBarTitle:
                                    LangEnum.termsAndConditions.tr(),
                                  });
                              }),
                          ///Log out
                          Center(
                            child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  Scaffold.of(context).closeDrawer();
                                  showBottomSheetFunction(
                                    content: const LogOutBottomSheetContent(),
                                  );
                                },
                                child: Text(
                                  LangEnum.logout.tr(),
                                  style: context.text.titleMedium?.copyWith(color: context.color.error),
                                )),
                          ).vPadding(24,),
                          ///Copy right
                          Center(
                            child: Text(
                              LangEnum.copyright.tr(),
                              style: context.text.bodyMedium?.copyWith(
                                  color: context.color.onPrimaryContainer),
                            ),
                          ),
                          // app version
                          const AppVersion(version: '1.0.0',).vPadding(4),
                        ],
                      ).hPadding(8),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }



}
