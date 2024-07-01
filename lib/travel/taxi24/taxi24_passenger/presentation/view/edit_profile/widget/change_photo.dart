import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_istimara/widget/CarIstimaraBottomSheetContent.dart';


class ChangePhotoWidget extends StatelessWidget {
  const ChangePhotoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Center(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () async{
            var checked = await  checkCameraPermission();
            if(checked??false){
              showBottomSheetFunction(
                content: CaristimaraBottomSheetContent(
                  pageType: '',
                ),
              );
            }else {
              return null;
            }
          },
          child: Container(
            width: 115,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: context.color.surfaceContainerHighest),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Images.editPenSVG,
                    width: 15,
                    height: 15
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  LangEnum.chagePic.tr(),
                  style: context.text.titleSmall,
                ),
              ],
            ),
          ),
        ));
  }
}
