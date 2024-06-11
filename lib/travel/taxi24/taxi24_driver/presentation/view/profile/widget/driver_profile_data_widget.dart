import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:showcaseview/showcaseview.dart';

class DriverProfileDataWidget extends StatefulWidget {

  final  GlobalKey globalKey;

  const DriverProfileDataWidget({Key? key,
  required this.globalKey}) : super(key: key);

  @override
  State<DriverProfileDataWidget> createState() => _DriverProfileDataWidgetState();
}

class _DriverProfileDataWidgetState extends State<DriverProfileDataWidget> {

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                Images.driverImage,
                fit: BoxFit.fill,
              ))),
          16.pw,

          Center(
            child: Text(
              'Abdelrhman Mobarak',
              style: context.text.titleMedium,
            )
          ),
          5.ph,
          Center(
            child: Container(
              width: 53,
              height: 32,
              decoration: BoxDecoration(
                  color: context.color.surface,
                  borderRadius: BorderRadius.circular(38)),
              child: Showcase(
                key: widget.globalKey,
                description: LangEnum.rateOption.tr(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Images.kStarSVG,
                      width: 13.3,
                      height: 12.7,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '1.0',
                      style: context.text.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),


        ]);
  }



}
