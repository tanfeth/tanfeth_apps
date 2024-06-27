import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/set_location_on_map_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/destination_header.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/where_to_go_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/previous_trips.dart';



class DestinationView extends ConsumerStatefulWidget{
  const DestinationView();
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DestinationView();

}

class _DestinationView extends ConsumerState<DestinationView>{



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: MainAppBar(
       titleWidget: DestinationHeader(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                20.ph,
                WhereToGoWidget(),
                15.ph,
                Expanded(
                  child:ref.watch(destinationListProvider).isEmpty?
                  PreviousTrips():
                  const SizedBox.shrink(),
                ),

                ElevatedButton(
                  onPressed: () async {
                    if(ref.read(destinationListProvider).isNotEmpty){
                      Get.toNamed(SetLocationOnMapRouting.config().path,
                          parameters: {
                            SetLocationOnMapRouting.pageType:
                            customAppFlavor.commonEnum.locationTypeEnum.pickUp
                          });
                    }else {
                      showToast(LangEnum.selectDestination.tr());
                    }
                  },
                  child: Text(LangEnum.confirm.tr()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}