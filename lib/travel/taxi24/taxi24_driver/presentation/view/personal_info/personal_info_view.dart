
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/delete_account.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/DriverModel.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/document_details/widget/image_coverter.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/personal_info/widget/change_photo.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/personal_info/widget/personal_info_cell.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/small_divider.dart';

class PersonalInfoView extends ConsumerStatefulWidget{
  const PersonalInfoView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PersonalInfoView();
  
}

class _PersonalInfoView extends ConsumerState<PersonalInfoView>{

  DriverModel driverModel = DriverModel();

  @override
  void initState() {
    driverModel.name = 'Abdelrhman Mobarak';
    driverModel.driverNumber = '0512345656';
    driverModel.email = 'abomobarak3@gmail.com';
    driverModel.dateOfBirth = '26/12/1994';
    driverModel.gender = 1;

    super.initState();
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.personalInfo.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 28,
                ),
                Center(
                  child: ClipOval(
                      child: SizedBox(
                          width: 74,
                          height: 74,
                          child: driverModel.profileImage == null
                              ? 
                              SvgPicture.asset(
                                Images.personAvatarSVG,
                                width: 74,
                                height: 74,
                              )
                              : ImageConverter(
                            base64String: driverModel.profileImage ?? "",
                          ))),
                ),
                SizedBox(
                  height: 16,
                ),
                const ChangePhotoWidget(),

                SizedBox(
                  height: 16,
                ),

                PersonalInfoItemWidget(
                    title: LangEnum.name.tr(),
                    data: driverModel.name ??"",
                    function: () {
                      // Navigator.pushNamed(context,
                      //   RoutePath.editNameScreen,);
                    }),

                10.ph,
                SmallDivider(),
                10.ph,
                PersonalInfoItemWidget(
                    title: LangEnum.mobile.tr(),
                    data: driverModel.userName ??"",
                    function: () {
                      // Navigator.pushNamed(context,
                      //   RoutePath.editPhoneScreen,);
                    }),

                10.ph,
                SmallDivider(),
                10.ph,

                PersonalInfoItemWidget(
                    title: LangEnum.email.tr(),
                    data: driverModel.email ??"",
                    isVerified: driverModel.isEmailVerified,
                    button: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {

                      },
                      child: Container(
                        height: 32,
                        width: 64,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(38),
                            color: context.color.primary),
                        child: Center(
                            child: Text(
                              LangEnum.verification.tr(),
                              style: context.text.titleMedium,
                    ),),),),
                    function: () {
                      // Navigator.pushNamed(context, RoutePath.editEmailScreen);
                    }),
                10.ph,
                SmallDivider(),
                10.ph,
                PersonalInfoItemWidget(
                  title: LangEnum.birthDate.tr(),
                  data:
                  driverModel.dateOfBirth?.split("T").
                  first.replaceAll("-", "/") ?? "",
                ),

                10.ph,
                SmallDivider(),
                10.ph,
                PersonalInfoItemWidget(
                  title: LangEnum.gender.tr(),
                  data:
                  driverModel.gender==0?
                  LangEnum.male.tr():
                  LangEnum.female.tr(),
                ),
                const DeleteAccount(),
                SizedBox(height: 49,),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}