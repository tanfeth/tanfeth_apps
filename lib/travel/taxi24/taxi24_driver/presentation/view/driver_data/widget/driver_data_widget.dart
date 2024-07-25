import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/vm/langauge/langauge_vm.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DriverDataWidget extends ConsumerWidget {
  final String image;
  final String title;
  final bool isDocument;
  final String? state;
  final String? stateNote;
  final String? expireDate;
  final VoidCallback function;

  const DriverDataWidget(
      {super.key,
      required this.image,
      required this.title,
      this.state,
      this.expireDate,
      this.isDocument = false,
      required this.stateNote,
      required this.function});

  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      onTap: function,
      // state?.toLowerCase()==
      //     customAppFlavor.commonEnum.driverStateEnum.approved
      //     ?(){}:function,
      child: Container(
        height: 70,
        margin:const  EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    image,
                    colorFilter: ColorFilter.mode(
                        context.color.onSurface, BlendMode.srcIn),
                  ),

                  20.pw,

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.start,
                          style: context.text.bodyMedium?.copyWith(
                              color: state?.toLowerCase() ==
                                      customAppFlavor
                                          .commonEnum.driverStateEnum.approved
                                  ? context.color.surfaceContainerHighest
                                  : context.color.onSurface),
                        ),


                        4.ph,

                        if (isDocument)
                          Text(
                            expireDate ?? "",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: context.color.surfaceContainerHighest),
                          ),

                        Expanded(
                          child: SizedBox(
                            width: 200,
                            child: Text(
                              'slkfhgklshdfkghlkjflgjsldjfgl',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: context.color.surfaceContainerHighest),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state == null)
                  SvgPicture.asset(
                    ref.watch(languageProvider) == 'en'
                        ? Images.arrowSVG
                        : Images.arrowLeftSVG,
                    width: 24,
                    height: 24,
                    colorFilter:
                    ColorFilter.mode(context.color.onSurface, BlendMode.srcIn),
                  ),
                if (state?.toLowerCase() ==
                    customAppFlavor.commonEnum.driverStateEnum.pending)
                  SvgPicture.asset(
                    Images.checkMarkCircleSVG,
                  ),
                if (state?.toLowerCase() ==
                    customAppFlavor.commonEnum.driverStateEnum.approved)
                  SvgPicture.asset(
                    Images.checkMarkCircleSVG,
                    colorFilter: ColorFilter.mode(
                        context.color.tertiary, BlendMode.srcIn),
                  ),
                if (state?.toLowerCase() ==
                    customAppFlavor.commonEnum.driverStateEnum.rejected)
                  SvgPicture.asset(
                    Images.errorSVG,
                    colorFilter: ColorFilter.mode(
                        context.color.error, BlendMode.srcIn),
                  ),

                5.ph,

                if (state?.toLowerCase() ==
                    customAppFlavor
                        .commonEnum.driverStateEnum.pending ||
                    state?.toLowerCase() ==
                        customAppFlavor
                            .commonEnum.driverStateEnum.approved)
                  Text(
                    LangEnum.completed.tr(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: context.color.surfaceContainerHighest),
                  ),
                if (state?.toLowerCase() ==
                    customAppFlavor.commonEnum.driverStateEnum.rejected)
                  Text(
                    LangEnum.resubmit.tr(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: context.color.surfaceContainerHighest),
                  ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
