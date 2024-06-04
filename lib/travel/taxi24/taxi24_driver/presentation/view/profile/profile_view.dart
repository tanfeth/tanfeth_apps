
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
import 'package:tanfeth_apps/common/shared/routing/routes/notification_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/send_message_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/web_view_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/welcome_route.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/verify/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/widget/driver_profile_data_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/widget/language_bottom_sheet.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/widget/profile_item.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/widget/profile_rate.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/app_version.dart';

class TaxiDriverProfile extends ConsumerStatefulWidget{
  const TaxiDriverProfile();
  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _TaxiDriverProfile();

}

class _TaxiDriverProfile extends ConsumerState<TaxiDriverProfile>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
           title: LangEnum.profile.tr(),
          leadingWidget: BackButtonWidget()),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 28,
                  ),
                  const DriverProfileDataWidget(),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ProfileRate(),
                          SizedBox(height: 24,),
                          ProfileItemWidget(
                              title: LangEnum.personalInfo.tr(),
                              icon: Images.personInfoSVG,
                              function: () {
                              }),
                          const LargeDivider(),
                          ProfileItemWidget(
                              title: LangEnum.earnings.tr(),
                              icon: Images.earningsProfileSVG,
                              function: () {
                              }),
                          const LargeDivider(),
                          ProfileItemWidget(
                              title: LangEnum.wallet.tr(),
                              icon: Images.walletProfileSVG,
                              function: () {
                              }),
                          const LargeDivider(),
                          ProfileItemWidget(
                              title: LangEnum.myCars.tr(),
                              icon: Images.carProfileSVG,
                              function: () {
                              }),
                          const LargeDivider(),
                          ProfileItemWidget(
                              title:LangEnum.document.tr(),
                              icon: Images.documentProfileSVG,
                              function: () {
                              }),
                          const LargeDivider(),
                          ProfileItemWidget(
                              title: LangEnum.notifications.tr(),
                              icon: Images.alertSVG,
                              function: () {
                                Get.toNamed(NotificationsRouting.config().path);
                              }),
                          const LargeDivider(),
                          ProfileItemWidget(
                              title: LangEnum.language.tr(),
                              icon: Images.languageSVG,
                              function: ()=> showBottomSheetFunction(
                                content: const LangBottomSheet(),
                              )),
                          const LargeDivider(),
                          ProfileItemWidget(
                              title: LangEnum.sendMessage.tr(),
                              icon: Images.sendSVG,
                              imageWidget: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: SvgPicture.asset(
                                  Images.sendSVG,
                                  height: 23,
                                  width: 23,
                                ),
                              ),
                              function: ()=> Get.toNamed(SendMessageRouting.config().path)),
                          const LargeDivider(),
                          ProfileItemWidget(
                              title: LangEnum.paymentAndPricing.tr(),
                              icon: Images.aboutProfileSVG,
                              function: ()=> Get.toNamed(WebViewRouting.config().path,
                                  parameters: {
                                    WebViewRouting.pageUrl:'https://www.youtube.com/',
                                    WebViewRouting.appBarTitle:LangEnum.paymentAndPricing.tr(),
                                  })),
                          const LargeDivider(),

                          ProfileItemWidget(
                              title:LangEnum.aboutAppName.tr(),
                              icon: Images.aboutProfileSVG,
                              function: ()=> Get.toNamed(WebViewRouting.config().path,
                                  parameters: {
                                    WebViewRouting.pageUrl:'https://www.youtube.com/',
                                    WebViewRouting.appBarTitle:LangEnum.aboutAppName.tr(),
                                  })),

                          const LargeDivider(),
                          ProfileItemWidget(
                              title:LangEnum.termsAndConditions.tr(),
                              icon: Images.aboutProfileSVG,
                              function: ()=> Get.toNamed(WebViewRouting.config().path,
                                  parameters: {
                                    WebViewRouting.pageUrl:'https://www.youtube.com/',
                                    WebViewRouting.appBarTitle:LangEnum.termsAndConditions.tr(),
                                  })),


                          const LargeDivider(),
                          ProfileItemWidget(
                              title:LangEnum.privacyPolicy.tr(),
                              icon: Images.aboutProfileSVG,
                              function: ()=> Get.toNamed(WebViewRouting.config().path,
                                  parameters: {
                                    WebViewRouting.pageUrl:'https://www.youtube.com/',
                                    WebViewRouting.appBarTitle:LangEnum.privacyPolicy.tr(),
                                  })),
                          const LargeDivider(),

                          ProfileItemWidget(
                              title:LangEnum.rateApp.tr(),
                              icon: Images.starSVG,
                              imageWidget: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Image.asset(
                                  Images.startGif,
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                              function: () => rateAppOnStore()),

                          const LargeDivider(),
                          ProfileItemWidget(
                              title:LangEnum.shareApp.tr(),
                              icon: Images.aboutProfileSVG,
                              imageWidget: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Image.asset(
                                  Images.shareGif,
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                              function: ()=> shareApp()),


                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  Get.offAllNamed(WelcomeRouting.config().path);
                                },
                                child: Text(
                                  LangEnum.logout.tr(),
                                  style: context.text.bodyLarge?.copyWith(
                                      color: context.color.error
                                  ),
                                )
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          AppVersion(),

                          SizedBox(
                            height: 2,
                          ),

                          Center(
                            child: Text(
                              LangEnum.copyright.tr(),
                              style: context.text.bodyMedium?.
                              copyWith(color: context.color.onPrimaryContainer),
                            ),
                          ),
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