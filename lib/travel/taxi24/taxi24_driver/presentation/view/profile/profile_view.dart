
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/mode/app_mode.dart';
import 'package:tanfeth_apps/common/shared/storage.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/verify/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/widget/driver_profile_data_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/widget/profile_item.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/widget/profile_rate.dart';

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
                          ProfileItemWidget(
                              title: LangEnum.earnings.tr(),
                              icon: Images.earningsProfileSVG,
                              function: () {
                              }),
                          ProfileItemWidget(
                              title: LangEnum.wallet.tr(),
                              icon: Images.walletProfileSVG,
                              function: () {
                              }),
                          ProfileItemWidget(
                              title: LangEnum.myCars.tr(),
                              icon: Images.carProfileSVG,
                              function: () {
                              }),
                          ProfileItemWidget(
                              title:LangEnum.document.tr(),
                              icon: Images.documentProfileSVG,
                              function: () {
                              }),
                          ProfileItemWidget(
                              title: LangEnum.notifications.tr(),
                              icon: Images.alertSVG,
                              function: () {

                              }),
                          ProfileItemWidget(
                              title: LangEnum.language.tr(),
                              icon: Images.languageSVG,
                              function: () {
                                String localCode = AppStorage.getLocaleCode();
                                AppMode.changeLanguageMode(localeCode: localCode =="en"?
                                "en":"ar",ref: ref);
                              }),
                          ProfileItemWidget(
                              title: LangEnum.help.tr(),
                              icon: Images.helpSVG,
                              function: () {
                              }),
                          ProfileItemWidget(
                              title:LangEnum.about.tr(),
                              icon: Images.aboutProfileSVG,
                              function: () {
                              }),
                          SizedBox(
                            height: 34,
                          ),
                          Center(
                            child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {

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
                            height: 30,
                          ),
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