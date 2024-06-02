import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/presentation/widget/phone_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/form_validation.dart';


class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> loginKey;

  const LoginForm({super.key,required this.loginKey});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: widget.loginKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.ph,
            PhoneFormField(
              validator: Validation.phone,
              hintText: LangEnum.numPhone.tr(),
              onChanged: (val) {
                if(val.length == 9){
                  closeKeyBoard();
                }
              },

            ),
            10.ph,
          ],
        ),
      ),
    );
  }
}
