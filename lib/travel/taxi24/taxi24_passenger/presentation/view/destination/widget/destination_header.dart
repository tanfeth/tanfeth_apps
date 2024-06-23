
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/change_rider_top_sheet.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

class DestinationHeader extends ConsumerStatefulWidget{
  final bool activePress;
  const DestinationHeader({this.activePress = true});
  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _DestinationHeader();


}

class _DestinationHeader extends ConsumerState<DestinationHeader>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: ()async{
          if(widget.activePress){
            await showTopModalSheet<String?>(context,
                const ChangeRiderTopSheet(),
            barrierDismissible: false);
          }

        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
                Images.avatar,
                width: 24,height: 24
            ),
            Padding(
              padding:  EdgeInsets.only(right: 15.0,left: 8),
              child: Text(
                LangEnum.changeRider.tr(),
                style: context.text.titleMedium,
              ),

            ),

            SvgPicture.asset(
                Images.downArrow,
                width: 24,height: 24
            ),
          ],),
      ),
    );
  }

}
