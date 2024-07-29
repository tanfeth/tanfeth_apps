import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/shared/sizes.dart';


class CouponWidget extends ConsumerStatefulWidget {
  const CouponWidget();
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CouponWidget();


}

class _CouponWidget extends ConsumerState<CouponWidget>{

  String couponVal = '';


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          LangEnum.couponDiscount.tr(),
          style: context.text.bodyLarge?.copyWith(fontWeight: FontWeight.bold,
              color: context.color.primary),
        ),
        10.ph,
        CustomTextFormField(
          keyboardType: TextInputType.text,
          hintText: LangEnum.couponHint.tr(),
          onChanged: (val) {
            couponVal = val;
            setState(() {});
          },
          suffixWidget: SizedBox(
            width: Get.width * 0.25,
            child: ElevatedButton(
              onPressed:couponVal.isNotEmpty?
                  () async {}:null,
              child: Text(LangEnum.activate.tr()),
            ),
          ),
        )
      ],
    );
  }
  
}


