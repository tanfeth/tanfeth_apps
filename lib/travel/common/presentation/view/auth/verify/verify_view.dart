import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pinput/pinput.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/system_ui_overlay_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/auth_routing/verify_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/layout_route.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/data/model/auth/ResponseVerifyModel.dart';
import 'package:tanfeth_apps/travel/common/presentation/view/auth/login/vm/login_vm.dart';
import 'package:tanfeth_apps/travel/common/presentation/view/auth/verify/vm/timer_verify_vm.dart';
import 'package:tanfeth_apps/travel/common/presentation/view/auth/verify/vm/verify_vm.dart';
import 'package:tanfeth_apps/travel/common/presentation/view/auth/verify/widget/timer.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/driver_data_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/terms_service_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/widget/auth_message_with_link.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/theme/pinput_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyView extends ConsumerStatefulWidget {
  const VerifyView({super.key});

  @override
  ConsumerState<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends ConsumerState<VerifyView> {
  late TimerVerifyVM timerVerifyVM;
  late VerifyVM verifyVM;
  final codeController = TextEditingController();
  bool timerState = false;
  late String phone;
  late String pageType;

  GlobalKey<FormState> pinKey = GlobalKey<FormState>();

  @override
  void initState() {
    timerVerifyVM = ref.read(timerVerifyProvider.notifier);
    verifyVM = ref.read(verifyProvider.notifier);
    phone = Get.parameters[VerifyRouting.phone] ?? '';
    pageType = Get.parameters[VerifyRouting.pageType] ?? '';
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      timerVerifyVM.updateTimer(currentStatus: true);
    });

    super.initState();
  }

  initBuild() {
    timerState = ref.watch(timerVerifyProvider);
  }

  @override
  Widget build(BuildContext context) {
    initBuild();

    return Scaffold(
      appBar: const MainAppBar(leadingWidget: BackButtonWidget()),
      body: WebWidth(
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            padding: 30.toAll,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LangEnum.enterCode.tr(), style: context.text.titleMedium),
                10.ph,
                Text(LangEnum.codeDesReset.tr()),
                15.ph,
                Center(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Form(
                      key: pinKey,
                      child: Pinput(
                        length: 4,
                        showCursor: true,
                        controller: codeController,
                        defaultPinTheme: pinPutTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        autofocus: true,
                        validator: (val) {
                          if ((val ?? '').length != 4) {
                            return LangEnum.verifyValidate.tr();
                          } else {
                            return null;
                          }
                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        onChanged: (val) {
                          if (val.length == 4) {
                            closeKeyBoard();
                          }
                        },
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                      ),
                    ),
                  ),
                ),
                20.ph,
                ElevatedButton(
                  onPressed: () async {
                    if (pinKey.currentState!.validate()) {
                      closeKeyBoard();
                      showLoading();
                      setDataModel();
                      verifyVM.userVerifyApi();

                      try {
                        var response = await ref.read(verifyVM.futureProvider);
                        hideLoading();
                        setLoginRoute(response:response);

                      } catch (e) {
                        hideLoading();
                        showFailed(msg: e.toString());
                      }
                    }
                  },
                  child: Text(LangEnum.sure.tr()),
                ),
                15.ph,
                timerState
                    ? TimerWidget(onEnd: () {
                        timerVerifyVM.updateTimer(currentStatus: false);
                      })
                    : AuthLinkedMsg(
                        message: LangEnum.resendCodeDesc.tr(),
                        linkTitle: LangEnum.resendCodeBtn.tr(),
                        onPressed: () async {
                          try {
                            closeKeyBoard();
                            showLoading();
                            ref
                                .read(taxiLoginProvider.notifier)
                                .bodyLoginModel
                                .phoneNumber = phone;
                            ref.read(taxiLoginProvider.notifier).userLoginApi();
                            await ref.read(ref
                                .read(taxiLoginProvider.notifier)
                                .futureProvider);
                            hideLoading();
                            showSuccess(msg: LangEnum.codeSentSuccess.tr());
                            timerVerifyVM.updateTimer(currentStatus: true);
                          } catch (e) {
                            hideLoading();
                            showFailed(msg: e.toString());
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    ).systemUiDarkText(context);
  }

  void setDataModel() {
    verifyVM.bodyVerifyModel.phoneNumber = phone;
    verifyVM.bodyVerifyModel.code = codeController.text;

    verifyVM.bodyVerifyModel.appEnum = customAppFlavor.appEnum;
  }


  void setLoginRoute({ResponseVerifyModel? response}) {

    /// user come from register
    if (pageType ==
        customAppFlavor
            .commonEnum.verifyTypeByEnum.register) {
      Get.toNamed(TermsOfServiceRouting.config().path);
    } else {
      ///Happy scenario
      if (response?.accountState ==
          customAppFlavor
              .commonEnum.accountStateEnum.approved &&
          !(response?.isInTrip ?? false)) {
        Get.offAllNamed(LayoutRouting.config().path);

        ///In case data have problem
      } else if(response?.accountState ==
          customAppFlavor
              .commonEnum.accountStateEnum.rejected){
        Get.offAllNamed(DriverDataRouting.config().path);

        ///In case order in pending
      }else if(response?.accountState ==
          customAppFlavor
              .commonEnum.accountStateEnum.pending){
        ///TODO go to order pending

        /// In case user in trip
      }else if((response?.isInTrip ?? false)){
        ///TODO go to trip view
      }
    }

  }
}
