import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/vm/langauge/langauge_vm.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/shared/enum/driver_state_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DriverDataWidget extends ConsumerWidget {

  final String image;
  final String title;
  final bool isDocument;
  final String? state;
  final String? expireDate;
  final VoidCallback function;


  const DriverDataWidget({
    Key? key,
    required this.image,
    required this.title,
    this.state,
    this.expireDate,
    this.isDocument=false,

  required this.function}) : super(key: key);


  @override
  Widget build(BuildContext context,ref) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: state?.toLowerCase()== customAppFlavor.commonEnum.driverStateEnum.approved
          ?(){}:function,
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                      image,
                    colorFilter: ColorFilter.mode(context.color.onSurface,
                        BlendMode.srcIn),
                  ),

                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        style: context.text.bodyMedium?.copyWith(
                          color: state?.toLowerCase()==
                              customAppFlavor.commonEnum.driverStateEnum.approved?
                              context.color.surfaceContainerHighest:
                              context.color.onSurface
                        ),
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
                      if(state?.toLowerCase() == customAppFlavor.commonEnum.driverStateEnum.pending||
                          state?.toLowerCase() == customAppFlavor.commonEnum.driverStateEnum.approved)

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
                ],
              ),
            ),

            if(state ==null)
              SvgPicture.asset(
                ref.watch(languageProvider) == 'en'
                ? Images.arrowSVG
                : Images.arrowLeftSVG,
                width: 24,
                height: 24,
    colorFilter: ColorFilter.mode(context.color.onSurface,
    BlendMode.srcIn),
    ),
            if(state?.toLowerCase()  == customAppFlavor.commonEnum.driverStateEnum.pending)
              SvgPicture.asset(
                Images.checkMarkCircleSVG,
              ),
            if(state ?.toLowerCase() == customAppFlavor.commonEnum.driverStateEnum.approved)
              SvgPicture.asset(
                Images.checkMarkCircleSVG,
                colorFilter: ColorFilter.mode(context.color.surfaceContainerHighest,
                    BlendMode.srcIn),
              ),
            if(state?.toLowerCase()  == customAppFlavor.commonEnum.driverStateEnum.rejected)
              SvgPicture.asset(
                Images.errorSVG,
              ),
          ],
        ),
      ),
    );
  }
}
