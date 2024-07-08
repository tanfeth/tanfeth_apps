
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/vm/car_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/vm/car_type_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/pick_up_location_vm.dart';

class TripDetailsWidget extends ConsumerStatefulWidget {
  const TripDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TripDetailsWidget();



}

class _TripDetailsWidget extends ConsumerState<TripDetailsWidget>{


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        ///Pick up location
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              SvgPicture.asset(
                Images.pickUp,
                height: 20,
                width: 20,
              ),
              10.pw,
              Expanded(
                child: Text(
                  ref.watch(pickUpLocationProvider).description ?? '',
                  style: context.text.bodyMedium,
                ),
              ),
            ],
          ),
        ),

        ///Destination location

        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children:[
              ...List.generate(ref
                  .watch(destinationListProvider).length, (index)=>
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Images.formFieldCircleSVG,
                      height: 20,
                      width: 20,
                    ),
                    10.pw,
                    Expanded(
                      child: Text(
                        ref
                            .watch(destinationListProvider)[index]
                            .description ??
                            '',
                        maxLines: 2,
                      ),)
                  ],
                ),
              )),
            ],
          ),
        ),
        20.ph,

        Text(
          LangEnum.carType.tr(),
          style: context.text.bodyLarge,
        ),
        10.ph,

        if(ref.watch(carListProvider).isNotEmpty)
        Row(
          children: [
            Image.asset(
                (ref.watch(carListProvider)[
                ref.watch(carTypeProvider)
                ].carImage??''),
              width: 60,
              height: 40,
            ),

            SizedBox(width: 16,),

            Text(
              (ref.watch(carListProvider)[
              ref.watch(carTypeProvider)
              ].carType??''),
              style: context.text.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }

}


