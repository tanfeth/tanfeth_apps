

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LoginView extends ConsumerStatefulWidget{
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView>{


  final phoneController = TextEditingController();
  final key = GlobalKey<FormState>();
  late bool isDisable=true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  initBuild(){

  }


  @override
  Widget build(BuildContext context) {
    initBuild();
    return SizedBox();

    // return Scaffold(
    //   appBar:  const CustomAppBar(showBackButton: false,),
    //   body: GestureDetector(
    //     behavior: HitTestBehavior.translucent,
    //     onTap: () {
    //       FocusScope.of(context).unfocus();
    //     },
    //     child: Form(
    //       key: key,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             children: [
    //               const Spacer(),
    //               GestureDetector(
    //                 behavior: HitTestBehavior.translucent,
    //                 onTap: (){
    //                   getIt<SettingsViewModel>().chooseLanguage(Localizations.localeOf(context).toString()=="en"?"ar":"en", context);
    //                 },
    //                 child: Container(
    //                   height: 40.h,
    //                   width: 95.w,
    //                   alignment: Alignment.center,
    //                   margin: EdgeInsets.symmetric(horizontal: 16.w),
    //                   decoration: BoxDecoration(
    //                     color: ColorsManager.greyColorE0E0E0,
    //                     borderRadius: BorderRadius.circular(38.r),
    //                   ),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Expanded(
    //                         child: Padding(
    //                           padding:  EdgeInsets.symmetric(horizontal: 8.w),
    //                           child: CustomSvgImage(
    //                             image: Localizations.localeOf(context).toString()=="en"?AssetsManager.saudiArabiaIconSVG:AssetsManager.englishSVG,
    //                             width: ScreenSizer.padding24,
    //                             height: 24.h,
    //                           ),
    //                         ),
    //                       ),
    //
    //                       Expanded(
    //                         child: CustomText(
    //                           text: Localizations.localeOf(context).toString()=="en"?"العربية":"English",
    //                           fontSize: FontSizer.s14,
    //                           fontWeight: FontWeightManager.regular,
    //                           textAlign: TextAlign.center,
    //                         ),
    //                       ),
    //                       SizedBox(
    //                         width: 12.w,
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 25.h,
    //           ),
    //           Padding(
    //             padding: EdgeInsets.symmetric(horizontal: ScreenSizer.padding24),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 CustomText(
    //                   text: "Enter your mobile number".tr(),
    //                   fontSize: FontSizer.s24,
    //                   fontWeight: FontWeightManager.large,
    //                   textAlign: TextAlign.start,
    //                 ),
    //                 SizedBox(
    //                   height: 8.h,
    //                 ),
    //                 CustomText(
    //                   text: "We’ll text you a code to verify your number".tr(),
    //                   fontSize: FontSizer.s18,
    //                   fontColor: ColorsManager.greyColor,
    //                   fontWeight: FontWeightManager.regular,
    //                   textAlign: TextAlign.start,
    //                 ),
    //               ],
    //             ),
    //           ),
    //           SizedBox(height: 24.h,),
    //           Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 12.w),
    //             child: BlocBuilder<AuthenticationViewModel,AuthenticationStates>(
    //                 buildWhen: (previous, current) => previous != current,
    //                 builder: (context, state){
    //                   return  MyTextFormField(
    //                       inputFormatters: [
    //                         FilteringTextInputFormatter.digitsOnly,
    //                       ],
    //                       maxLength: 9,
    //                       controller: phoneController,
    //                       keyboardType: TextInputType.phone,
    //                       validator: (String value) =>  AppValidators.phoneNumberValidation(value: value),
    //                       prefixIcon: Row(
    //                         mainAxisSize: MainAxisSize.min,
    //                         children: [
    //                           Padding(
    //                             padding: EdgeInsets.symmetric(horizontal: 12.w),
    //                             child: const CustomSvgImage(
    //                               image: AssetsManager.saudiArabiaIconSVG,
    //                             ),
    //                           ),
    //                           CustomText(
    //                               text: "+966",
    //                               fontColor: const Color(0xFF757575),
    //                               fontSize: FontSizer.s16),
    //                           Container(
    //                             margin: EdgeInsets.symmetric(horizontal: 12.w),
    //                             width: 1.w,
    //                             height: 24.h,
    //                             decoration: const BoxDecoration(
    //                               color: Color(0xFFE0E0E0),
    //                             ),
    //                           )
    //                         ],
    //                       ),
    //                       suffixIcon: phoneController.text.isEmpty ? null : GestureDetector(
    //                         onTap: () {
    //                           phoneController.clear();
    //                           isDisable=viewModel.checkValue("");
    //                         },
    //                         child: Icon(
    //                           Icons.close,
    //                           size: 24.h,
    //                           color: ColorsManager.blackColor,
    //                         ),
    //                       ),
    //                       onChanged: (String value) {
    //                         isDisable=viewModel.checkValue(value);
    //                       }
    //                   );
    //                 }
    //             ),
    //           ),
    //           const Spacer(),
    //           BlocBuilder<AuthenticationViewModel,AuthenticationStates>(
    //               buildWhen: (previous, current) => previous != current,
    //               builder: (context, state){
    //                 return PrimaryButton(
    //                   text: "Continue".tr(),
    //                   isLoading: state is  AuthenticationLoadingState ? true : false,
    //                   isDisable: isDisable,
    //                   onPressed: () {
    //                     if (key.currentState!.validate()) {
    //                       FocusScope.of(context).unfocus();
    //                       viewModel.sendCode(phone: "966${phoneController.text}").then((value) {
    //                         Navigator.pushNamed(context, RoutePath.otpScreen, arguments: {"phone": phoneController.text});
    //                       });
    //                     }
    //                   },
    //                   color: ColorsManager.baseOrange,
    //                   colorText: ColorsManager.blackColor,
    //                 );
    //               }
    //           ),
    //           SizedBox(height: 50.h)
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

}