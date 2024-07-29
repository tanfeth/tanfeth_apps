import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';

class PersonalInfoItemWidget extends ConsumerWidget {

  final String data;
  final String title;
  final Widget? button;
  final bool? isVerified;
  final VoidCallback ?function;
  
  
  const PersonalInfoItemWidget(
      {Key? key,
        required this.title,
        required this.data,
        this.button,
        this.isVerified,
         this.function})
      : super(key: key);


  @override
  Widget build(BuildContext context,ref) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: function,
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: context.color.surfaceContainerHighest
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),


                  Text(
                    data,
                    style: TextStyle(
                        color: context.color.surfaceContainerHighest
                    ),
                  ),
                ],
              ),
            ),


            if (isVerified == false) button!,
            SizedBox(
              width: 24,
            ),
            if (function != null)
              SvgPicture.asset(
                ref.watch(languageProvider)=='en'?
                  Images.arrowSVG:Images.arrowLeftSVG,
                width: 24,
                height: 24,
              )
          ],
        ),
      ),
    );
  }
}
