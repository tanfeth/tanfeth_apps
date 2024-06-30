import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/presentation/widget/divider.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/notification_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/send_message_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/web_view_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/welcome_route.dart';
import 'package:tanfeth_apps/common/shared/storage.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/common/vm/langauge/langauge_vm.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/app_version.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/language_bottom_sheet.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/profile_item.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/personal_info_route.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/my_trip/passenger_my_trip_view.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/profile/widget/passenger_profile_data_widget.dart';


class TaxiPassengerProfileView extends ConsumerStatefulWidget {
  const TaxiPassengerProfileView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaxiDriverProfile();
}

class _TaxiDriverProfile extends ConsumerState<TaxiPassengerProfileView> {



  GlobalKey four = GlobalKey();
  GlobalKey five = GlobalKey();
  GlobalKey six = GlobalKey();
  GlobalKey seven = GlobalKey();
  GlobalKey eight = GlobalKey();
  GlobalKey nine = GlobalKey();
  GlobalKey ten = GlobalKey();

  @override
  void initState() {
    if(AppStorage.getProfileCase() == true) {
      showCaseEvent(context: context, caseList: [four, five, six, seven, eight, nine, ten]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: LangEnum.profile.tr()),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 28,),
                  PassengerProfileDataWidget(),
                  40.ph,
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // person_info
                          ProfileCell(
                              title: LangEnum.editProfile.tr(),
                              icon: Images.personInfoSVG,
                              function: () {
                                Get.toNamed(PersonalInfoRouting.config().path);
                              }),
                          const LargeDivider(),
                          // my trip
                          ProfileCell(
                              title: LangEnum.myTrips.tr(),
                              icon: Images.fullClockSVG,
                              function: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>PassengerMyTripView()));
                                //Get.toNamed(EarningRouting.config().path);
                              }),
                          const LargeDivider(),
                          // favourite place
                          ProfileCell(
                              title: LangEnum.favourite.tr(),
                              icon: Images.locationSVG,
                              function: () {
                               // Get.toNamed(WalletRouting.config().path);
                              }),
                          const LargeDivider(),
                          // notification
                          ProfileCell(
                              title: LangEnum.notifications.tr(),
                              icon: Images.alertSVG,
                              function: () {
                                Get.toNamed(NotificationsRouting.config().path);
                              }),
                          const LargeDivider(),
                          // language
                          ProfileCell(
                              title: LangEnum.language.tr(),
                              icon: Images.languageSVG,
                              function: () => showBottomSheetFunction(
                                content: const LangBottomSheet(),
                              )),
                          const LargeDivider(),
                          // help
                          ProfileCell(
                              title: LangEnum.help.tr(),
                              icon: Images.helpSVG,
                              function: () => Get.toNamed(SendMessageRouting.config().path)),
                          const LargeDivider(),
                          // terms And Conditions
                          ProfileCell(
                              title: LangEnum.termsAndConditions.tr(),
                              icon: Images.aboutProfileSVG,
                              function: () => Get.toNamed(
                                  WebViewRouting.config().path,
                                  parameters: {
                                    WebViewRouting.pageUrl:
                                    '${customAppFlavor.commonEnum.appDataEnum.termsAndCondition+
                                        ref.watch(languageProvider)}',
                                    WebViewRouting.appBarTitle:
                                    LangEnum.termsAndConditions.tr(),
                                  })),
                          const LargeDivider(),
                          // rate app
                          Showcase(
                            key: nine,
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
                                function: () => rateAppOnStore()),
                          ),
                          const LargeDivider(),
                          //share app
                          Showcase(
                            key:ten,
                            description: LangEnum.shareOption.tr(),
                            child: ProfileCell(
                                title: LangEnum.shareApp.tr(),
                                imageWidget: Image.asset(
                                  Images.shareGif,
                                  height: 25,
                                  width: 25,
                                ).hPadding(8),
                                function: () => shareApp()),
                          ),
                          const LargeDivider(),
                          // become  a captain
                          ProfileCell(
                              title: LangEnum.becomeCaptain.tr(),
                              icon: Images.becomeCaptainSVG,
                              function: () => Get.toNamed(
                                  WebViewRouting.config().path,
                                  parameters: {
                                    WebViewRouting.pageUrl:
                                    '${customAppFlavor.commonEnum.appDataEnum.termsAndCondition+ref.watch(languageProvider)}',
                                    WebViewRouting.appBarTitle:
                                    LangEnum.termsAndConditions.tr(),
                                  })),
                          //log out
                          Center(
                            child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  Get.offAllNamed(WelcomeRouting.config().path);
                                },
                                child: Text(
                                  LangEnum.logout.tr(),
                                  style: context.text.titleMedium?.copyWith(color: context.color.error),
                                )),
                          ).vPadding(24,),
                          // copy right
                          Center(
                            child: Text(
                              LangEnum.copyright.tr(),
                              style: context.text.bodyMedium?.copyWith(
                                  color: context.color.onPrimaryContainer),
                            ),
                          ),
                          // app version
                          AppVersion(version: '1.0.0',).vPadding(4),
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
