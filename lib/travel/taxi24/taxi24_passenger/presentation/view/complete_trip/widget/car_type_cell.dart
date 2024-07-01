
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/CarTypeModel.dart';


class CarTypeCell extends ConsumerStatefulWidget{
  final CarTypeModel carTypeModel;
  const CarTypeCell({super.key,required this.carTypeModel});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_CarTypeWidget();
  
}

class _CarTypeWidget extends ConsumerState<CarTypeCell>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 45,
            height: 50,
            child: Image.network(
              widget.carTypeModel.carImage??'',
              fit: BoxFit.fill,
            ),
          ),

          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    widget.carTypeModel.carType??'',
                    style: context.text.bodyLarge,
                  ),

                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Images.passengerSVG,
                        width: 9.33,
                        height: 12,
                      ),
                      SizedBox(
                        width: 7.33,
                      ),
                      Text(
                        widget.carTypeModel.passengersNumber.toString()
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Row(
            children: [
              Text(
                "${widget.carTypeModel.tripCost}",
                 style: context.text.bodyLarge,
              ),
              5.pw,
              Text(
                " ${LangEnum.sar.tr()}",
                //style: context.text.titleMedium,
              ),

            ],
          ),

        ],
      ),
    );
  }
  
}