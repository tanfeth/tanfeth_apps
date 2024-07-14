import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tanfeth_apps/common/presentation/dialog/WarningBottomSheet.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/auth_routing/register_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/auth_routing/verify_route.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/view/auth/login/vm/login_vm.dart';
import 'package:tanfeth_apps/travel/common/presentation/view/auth/login/widget/login_form.dart';
import 'package:tanfeth_apps/travel/common/presentation/view/auth/login/widget/login_info.dart';
import 'package:tanfeth_apps/travel/common/presentation/view/auth/login/widget/visitor_button.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/widget/auth_message_with_link.dart';

class TravelLoginView extends ConsumerStatefulWidget {
  const TravelLoginView({super.key});

  @override
  ConsumerState<TravelLoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<TravelLoginView> {
  final phoneController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  late bool isDisable = true;
  FocusNode focusNode = FocusNode();
  late TaxiLoginVM taxiLoginVM ;


  @override
  void initState() {
    super.initState();
  }

  initBuild() {
    taxiLoginVM = ref.watch(taxiLoginProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    initBuild();
    return Scaffold(
      appBar: const MainAppBar(
        //leadingWidget: BackButtonWidget(),
        trailingWidget: VisitorButton(),
      ),
      body: WebWidth(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            closeKeyBoard();
          },
          child: Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(LangEnum.welcome.tr(), style: context.text.titleMedium),
                  20.ph,
                  const LoginInfo(),
                  30.ph,
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: LoginForm(
                      loginKey: loginKey,
                      controller: phoneController,
                    ),
                  ),
                  10.ph,
                  ElevatedButton(
                    onPressed: () async {
                      if (loginKey.currentState!.validate()) {
                        closeKeyBoard();
                        showLoading();
                        taxiLoginVM.bodyLoginModel.phoneNumber=
                            phoneController.text;
                        taxiLoginVM.userLoginApi();
                        try{
                          var response = await ref.read(
                              taxiLoginVM
                                  .futureProvider);
                               hideLoading();
                             if(response?.success??false){
                                Get.toNamed(VerifyRouting.config().path,
                                arguments: {
                                  VerifyRouting.phone:phoneController.text
                                });
                             }
                        }catch(e){
                          hideLoading();
                          showToast(e.toString());
                        }

                      }
                    },
                    child: Text(LangEnum.continueWord.tr()),
                  ),
                  10.ph,

                  AuthLinkedMsg(
                    message: LangEnum.doNotHaveAccount.tr(),
                    linkTitle: LangEnum.registerNow.tr(),
                    onPressed: () => Get.toNamed(RegisterRouting.config().path),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
