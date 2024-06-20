
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/home_route.dart';
import 'package:tanfeth_apps/travel/common/shared/form_validation.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/home_view.dart';


class WhereWidget extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WhereWidget();

}

class _WhereWidget extends ConsumerState<WhereWidget>{

  final placeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return   Container(
      color: context.color.surface,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      margin: EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          Text(
            LangEnum.hello.tr(),
            style: context.text.titleMedium,
          ),

          SizedBox(height: 15,),

          CustomTextFormField(
              controller: placeController,
              keyboardType: TextInputType.text,
              hintText: LangEnum.whereTo.tr(),
              textInputAction: TextInputAction.next,
              validator: Validation.notEmpty,
              prefixIcon: LineIcons.locationArrow,
              readOnly: true,
              onChanged: (String value) {}),

          /*            MyTextFormField(
                      hintText: "Where to?".tr(),
                      readOnly: true,
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          CustomSvgImage(
                            image: Images.formFieldCircleSVG,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                      noPadding: true,
                      onTap: () async {
                        if (locationPermission) {
                          Navigator.pushNamed(context, RoutePath.selectDestinationScreen);
                        }
                        else{
                          await alertViewModel.requestPermission();
                        }
                      },
                    ),*/

        ],
      ),
    );
  }

}