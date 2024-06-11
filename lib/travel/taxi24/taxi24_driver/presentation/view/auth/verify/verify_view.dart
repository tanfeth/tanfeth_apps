import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pinput/pinput.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/system_ui_overlay_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/home_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/layout_route.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/verify/vm/verify_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/verify/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/verify/widget/timer.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/widget/auth_message_with_link.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/theme/pinput_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyView extends ConsumerStatefulWidget {
  const VerifyView({super.key});

  @override
  ConsumerState<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends ConsumerState<VerifyView> {
  late VerifyVM verifyVM;
  bool timerState = false;

  GlobalKey<FormState> pinKey =  GlobalKey<FormState>();

  @override
  void initState() {
    verifyVM = ref.read(verifyProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      verifyVM.updateTimer(currentStatus: true);
    });

    super.initState();
  }

  initBuild() {
    timerState = ref.watch(verifyProvider);
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
                        defaultPinTheme: pinPutTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        autofocus: true,
                        validator: (val){
                          if((val??'').length != 4){
                            return LangEnum.verifyValidate.tr();
                          }else{
                            return null;
                          }

                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        onChanged: (val) {
                          if(val.length == 4){
                            closeKeyBoard();
                          }
                        },
                        onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      ),
                    ),
                  ),
                ),
                20.ph,
                ElevatedButton(
                  onPressed: () async {
                    if (pinKey.currentState!.validate()) {
                      Get.offAllNamed(LayoutRouting.config().path);
                    }

                    // try {} catch (e) {
                    //   showToast(e.toString());
                    // }
                  },
                  child: Text(LangEnum.sure.tr()),
                ),
                15.ph,
                timerState
                    ? TimerWidget(onEnd: () {
                        verifyVM.updateTimer(currentStatus: false);
                      })
                    : AuthLinkedMsg(
                        message: LangEnum.resendCodeDesc.tr(),
                        linkTitle: LangEnum.resendCodeBtn.tr(),
                        onPressed: () async {
                          verifyVM.updateTimer(currentStatus: true);
                          try {
                            //  await vm.resendCode();
                          } catch (e) {
                            showToast(e.toString());
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
}
