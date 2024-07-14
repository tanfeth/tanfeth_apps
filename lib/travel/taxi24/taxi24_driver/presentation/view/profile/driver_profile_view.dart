import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/presentation/widget/divider.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/document_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/notification_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/send_message_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/web_view_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/welcome_route.dart';
import 'package:tanfeth_apps/common/shared/storage.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/common/vm/langauge/langauge_vm.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/language_bottom_sheet.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/profile_item.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/cars_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/earning_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/personal_info_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/wallet_route.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/widget/driver_profile_data_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/widget/profile_rate.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/app_version.dart';
import 'package:showcaseview/showcaseview.dart';


class TaxiDriverProfile extends ConsumerStatefulWidget {
  const TaxiDriverProfile({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaxiDriverProfile();
}

class _TaxiDriverProfile extends ConsumerState<TaxiDriverProfile> {



  GlobalKey one = GlobalKey();
  GlobalKey two = GlobalKey();
  GlobalKey three = GlobalKey();
  GlobalKey four = GlobalKey();
  GlobalKey five = GlobalKey();
  GlobalKey six = GlobalKey();
  GlobalKey seven = GlobalKey();

  @override
  void initState() {
    if(AppStorage.getProfileCase() == true) {
      showCaseEvent(context: context,
          caseList: [one, two, three, four, five, six, seven]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: LangEnum.profile.tr(),
          leadingWidget:  BackButtonWidget(
            onTap: (){
              Scaffold.of(context).closeDrawer();
            },
          )),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const SizedBox(height: 28,),
                   DriverProfileDataWidget(
                    globalKey: one,
                  ),
                   Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileRate(
                            five: two,
                            six: three,
                          ),
                          24.ph,
                          ProfileCell(
                              title: LangEnum.personalInfo.tr(),
                              icon: Images.personInfoSVG,
                              function: () {
                                Get.toNamed(PersonalInfoRouting.config().path);
                              }),
                          const LargeDivider(),
                          ProfileCell(
                              title: LangEnum.earnings.tr(),
                              icon: Images.earningsProfileSVG,
                              function: () {
                                Get.toNamed(EarningRouting.config().path);
                              }),
                          const LargeDivider(),
                          ProfileCell(
                              title: LangEnum.wallet.tr(),
                              icon: Images.walletProfileSVG,
                              function: () {
                                Get.toNamed(WalletRouting.config().path);
                              }),
                          const LargeDivider(),
                          Showcase(
                            key: four,
                            description: LangEnum.carsOption.tr(),
                            child: ProfileCell(
                                title: LangEnum.myCars.tr(),
                                icon: Images.carProfileSVG,
                                function: () {
                                  Get.toNamed(CarsRouting.config().path);
                                }),
                          ),
                          const LargeDivider(),
                          ProfileCell(
                              title: LangEnum.document.tr(),
                              icon: Images.documentProfileSVG,
                              function: () {
                                Get.toNamed(DocumentRouting.config().path);
                              }),
                          const LargeDivider(),
                          ProfileCell(
                              title: LangEnum.notifications.tr(),
                              icon: Images.alertSVG,
                              function: () {
                                Get.toNamed(NotificationsRouting.config().path);
                              }),
                          const LargeDivider(),
                          ProfileCell(
                              title: LangEnum.language.tr(),
                              icon: Images.languageSVG,
                              function: () => showBottomSheetFunction(
                                    content: const LangBottomSheet(),
                                  )),
                          const LargeDivider(),
                          ProfileCell(
                              title: LangEnum.sendMessage.tr(),
                              icon: Images.sendSVG,
                              imageWidget: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SvgPicture.asset(
                                  Images.sendSVG,
                                  height: 23,
                                  width: 23,
                                ),
                              ),
                              function: () => Get.toNamed(
                                  SendMessageRouting.config().path)),
                          const LargeDivider(),
                          Showcase(
                            key: five,
                            description: LangEnum.priceOption.tr(),
                            child: ProfileCell(
                                title: LangEnum.paymentAndPricing.tr(),
                                icon: Images.aboutProfileSVG,
                                function: () => Get.toNamed(
                                        WebViewRouting.config().path,
                                        parameters: {
                                          WebViewRouting.pageUrl:
                                              'https://www.youtube.com/',
                                          WebViewRouting.appBarTitle:
                                              LangEnum.paymentAndPricing.tr(),
                                        })),
                          ),
                          const LargeDivider(),
                          ProfileCell(
                              title: LangEnum.aboutAppName.tr(),
                              icon: Images.aboutProfileSVG,
                              function: () => Get.toNamed(
                                      WebViewRouting.config().path,
                                      parameters: {
                                        WebViewRouting.pageUrl:
                                            customAppFlavor.commonEnum.appDataEnum.aboutApp+ref.watch(languageProvider),
                                        WebViewRouting.appBarTitle:
                                            LangEnum.aboutAppName.tr(),
                                      })),
                          const LargeDivider(),
                          ProfileCell(
                              title: LangEnum.termsAndConditions.tr(),
                              icon: Images.aboutProfileSVG,
                              function: () => Get.toNamed(
                                      WebViewRouting.config().path,
                                      parameters: {
                                        WebViewRouting.pageUrl:
                                            customAppFlavor.commonEnum.appDataEnum.termsAndCondition+ref.watch(languageProvider),
                                        WebViewRouting.appBarTitle:
                                            LangEnum.termsAndConditions.tr(),
                                      })),
                          const LargeDivider(),
                          ProfileCell(
                              title: LangEnum.privacyPolicy.tr(),
                              icon: Images.aboutProfileSVG,
                              function: () => Get.toNamed(
                                      WebViewRouting.config().path,
                                      parameters: {
                                        WebViewRouting.pageUrl:
                                            customAppFlavor.commonEnum.appDataEnum.policy+ref.watch(languageProvider),
                                        WebViewRouting.appBarTitle:
                                            LangEnum.privacyPolicy.tr(),
                                      })),
                          const LargeDivider(),
                          Showcase(
                            key: six,
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
                          Showcase(
                            key:seven,
                            description: LangEnum.shareOption.tr(),
                            onBarrierClick: ()async{
                              await   AppStorage.showProfileCase(false);
                            },
                            onToolTipClick: ()async{
                              await   AppStorage.showProfileCase(false);
                            },
                            onTargetClick: ()async{
                              await   AppStorage.showProfileCase(false);
                            },
                            child: ProfileCell(
                                title: LangEnum.shareApp.tr(),
                                icon: Images.aboutProfileSVG,
                                imageWidget: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Image.asset(
                                    Images.shareGif,
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                                function: () => shareApp()),
                          ),
                          20.ph,
                          Center(
                            child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  Get.offAllNamed(WelcomeRouting.config().path);
                                },
                                child: Text(
                                  LangEnum.logout.tr(),
                                  style: context.text.bodyLarge
                                      ?.copyWith(color: context.color.error),
                                )),
                          ),
                          10.ph,
                          Center(
                            child: Text(
                              LangEnum.copyright.tr(),
                              style: context.text.bodyMedium?.copyWith(
                                  color: context.color.onPrimaryContainer),
                            ),
                          ),
                          2.ph,
                          const AppVersion(version: '1.0.0',),
                          15.ph,
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }


  
}
