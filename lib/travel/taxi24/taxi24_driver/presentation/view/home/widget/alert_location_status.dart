import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/home/widget/home_alert.dart';


class AlertLocationStatusWidget extends StatelessWidget {
  const AlertLocationStatusWidget({Key? key,required this.bodyText,required this.function, required this.isVisible}) : super(key: key);
  final String bodyText;
  final VoidCallback function;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child:  Alert(
        bodyColor: context.color.primary,
        borderColor: context.color.primary.withOpacity(0.3),
        text: bodyText,
        buttonText: LangEnum.enable.tr(),
        buttonFunction:function,
      ),
    );
  }
}
