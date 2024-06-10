import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tanfeth_apps/common/presentation/widget/country_code/country_code_widget.dart';
import 'package:tanfeth_apps/common/presentation/widget/phone_form_field_widget.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/form_validation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class LoginForm extends ConsumerStatefulWidget {
  final GlobalKey<FormState> loginKey;

  const LoginForm({super.key,required this.loginKey});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {

  Country selectedMobile = getCountry();

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

            CustomTextFormField(
                keyboardType: TextInputType.phone,
                hintText: LangEnum.numPhone.tr(),
                textInputAction: TextInputAction.next,
                validator: Validation.notEmpty,
                prefixIcon: Icons.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                suffixWidget: CountryCodeWidget(
                  onSelect: (Country country) {
                    selectedMobile = country;
                    setState(() {});
                  },
                  selectedPhoneCountry: selectedMobile,
                ),
                onChanged: (String value) {}),

            10.ph,
          ],
        ),
      ),
    );
  }
}
