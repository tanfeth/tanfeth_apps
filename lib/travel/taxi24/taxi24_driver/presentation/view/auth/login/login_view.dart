import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/auth_routing/verify_route.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/login/widget/login_form.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/login/widget/login_info.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/verify/widget/back_button_widget.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final phoneController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  late bool isDisable = true;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  initBuild() {}

  @override
  Widget build(BuildContext context) {
    initBuild();
    return Scaffold(
      appBar: const MainAppBar(leadingWidget: BackButtonWidget()),
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
                  LoginInfo(),
                  30.ph,
                  Expanded(
                      child: LoginForm(
                    loginKey: loginKey,
                  )),
                  ElevatedButton(
                    onPressed: () async {
                      if (loginKey.currentState!.validate()) {
                        closeKeyBoard();
                        Get.toNamed(VerifyRouting.config().path);
                      }
                    },
                    child: Text(LangEnum.continueWord.tr()),
                  ),
                  20.ph,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
