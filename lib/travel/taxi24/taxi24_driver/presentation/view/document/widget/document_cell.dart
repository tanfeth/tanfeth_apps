import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DocumentCell extends ConsumerWidget {
  const DocumentCell({
    Key? key,
    required this.image,
    required this.title,
    this.state,
    this.expireDate,
    this.isDocument=false,

  required this.function}) : super(key: key);
  final String image;
  final String title;
  final bool isDocument;
  final String? state;
  final String? expireDate;
  final VoidCallback function;

  @override
  Widget build(BuildContext context,ref) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: state?.toLowerCase()== customAppFlavor.commonEnum.driverStateEnum
          .approved?(){}:function,
      child: SizedBox(
        height: 56,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
                image,
              colorFilter: ColorFilter.mode(context.color.onSurface,
                  BlendMode.srcIn),

            ),
            SizedBox(
              width: 20,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.text.bodyMedium?.copyWith(
                      color: context.color.onSurface
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 4,),
                  if(isDocument)
                    Text(
                      expireDate??"",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: context.color.surfaceContainerHighest
                      ),
                    ),
                  if(state?.toLowerCase() ==
                      customAppFlavor.commonEnum.driverStateEnum.pending ||
                      state?.toLowerCase()  ==
                          customAppFlavor.commonEnum.driverStateEnum.approved)
                    Text(
                      LangEnum.completed.tr(),
                       textAlign: TextAlign.start,
                      style: TextStyle(
                          color: context.color.surfaceContainerHighest
                      ),
                    ),
                  if(state?.toLowerCase()  ==
                      customAppFlavor.commonEnum.driverStateEnum.rejected)
                    Text(
                      LangEnum.resubmit.tr(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: context.color.surfaceContainerHighest
                      ),
                    ),
                ],
              ),
            ),

            if(state ==null)
              SvgPicture.asset(
                ref.watch(languageProvider) == "en"?
                    Images.arrowSVG:
                    Images.arrowLeftSVG,
                colorFilter:ColorFilter.mode(
                    context.color.onSurface,
                    BlendMode.srcIn) ,
              ),
            if(state?.toLowerCase()  == customAppFlavor.commonEnum.driverStateEnum.pending)
               SvgPicture.asset(Images.checkMarkCircleSVG),
            if(state ?.toLowerCase() == customAppFlavor.commonEnum.driverStateEnum.approved)
              SvgPicture.asset(Images.checkMarkCircleSVG,
               colorFilter:ColorFilter.mode(
                   context.color.surfaceContainerHighest,
                   BlendMode.srcIn)),
            if(state?.toLowerCase()  == customAppFlavor.commonEnum.driverStateEnum.rejected)
              SvgPicture.asset(Images.errorSVG),
          ],
        ),
      ),
    );
  }
}
