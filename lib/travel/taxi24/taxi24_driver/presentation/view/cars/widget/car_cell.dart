
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/CarModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/cars/widget/car_bottom_sheet_content.dart';

class CarCell extends ConsumerStatefulWidget{
  final CarModel carModel;
  CarCell({required this.carModel});
  
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CarCell();

}

class _CarCell extends ConsumerState<CarCell>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        showBottomSheetFunction(
          content:  CarBottomSheetContent(carModel:widget.carModel,),
        );
      },
      child:  SizedBox(
        height: widget.carModel.isDefault! ? 112 : 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SvgPicture.asset(
              Images.carSVG,
              width: 50,
              height: 50,
            ),
        
            SizedBox(
              width: 20,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.carModel.carType??''} ${widget.carModel.carModel??''} "
                        "${widget.carModel.carYear??''}",
                     style: context.text.titleMedium,
                  ),
                  SizedBox(
                    height: 8
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "${widget.carModel.plateNo}-${widget.carModel.plateLetterLeft}"
                            "${widget.carModel.plateLetterMiddle}"
                            "${widget.carModel.plateLetterRight}",
                        style: TextStyle(
                          color: context.color.surfaceContainerHighest
                        ),
                      ),


                      Container(
                        height: 4,
                        width: 4,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 8,right: 8,top: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: context.color.surfaceContainerHighest
                        ),
                      ),

                      Text(
                        widget.carModel.carColor??'',
                        style: TextStyle(
                            color: context.color.surfaceContainerHighest
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  if (widget.carModel.isDefault??false)
                    Container(
                      width: 80,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: context.color.tertiary),
                      child: Center(
                        child: Text(
                          LangEnum.active.tr(),
                          textAlign: TextAlign.center,
                          style: context.text.bodyLarge?.copyWith(
                            color: context.color.onTertiary,
                          ),
                        )
                      ),
                    ),
                ],
              ),
            ),


            SvgPicture.asset(
              Images.moreSVG,
              width: 4,
              height: 18,
            ),
          ],
        ),
      )
    );
  }
  
}