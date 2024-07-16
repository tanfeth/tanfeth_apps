import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/vm/choose_ride_map_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/destination_header.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/where_to_go_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/previous_trips.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/show_case.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/storage.dart';


class DestinationView extends ConsumerStatefulWidget{
  const DestinationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DestinationView();

}

class _DestinationView extends ConsumerState<DestinationView>{



  @override
  void initState() {
    if(TaxiPassengerAppStorage.getDestinationCase() == true){
      Future.delayed(const Duration(seconds: 1),(){
        showCaseEvent(context: context,caseList: [
          showcaseKey14,
          showcaseKey15,
        ]);
      });

    }

    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: MainAppBar(
         titleWidget: const DestinationHeader(),
          leadingWidget:  BackButtonWidget(
            onTap: (){
              ref.read(chooseRideMapProvider.notifier).handleMarkersAndPolyLines();
              Get.back();
        
            },
          ),
        ),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                20.ph,
                const WhereToGoWidget(),
                15.ph,
                const Expanded(
                  child:PreviousTrips(),
                ),

                ElevatedButton(
                  onPressed: () async {
                    if(ref.read(destinationListProvider).isNotEmpty){
                      ref.read(chooseRideMapProvider.notifier)
                      .handleMarkersAndPolyLines();
                      Get.back();

                      // Get.toNamed(SetLocationOnMapRouting.config().path,
                      //     parameters: {
                      //       SetLocationOnMapRouting.pageType:
                      //       customAppFlavor.commonEnum.locationTypeEnum.pickUp
                      //     });
                    }else {
                      showToast(LangEnum.selectDestination.tr());
                    }
                  },
                  child: Text(LangEnum.confirm.tr()),
                ),

                15.ph
              ],
            ),
          ),
        ),
      ),
    );
  }

}