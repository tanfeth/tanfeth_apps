import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/choose_ride_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/destination_header.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/destination_list.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/set_on_map_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/where_to_go_widget.dart';

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
                20.ph,
                SizedBox(height:16),
                Expanded(
                  child:DestinationList(),
                ),

                ElevatedButton(
                  onPressed: () async {
                    if(ref.read(destinationListProvider).isNotEmpty){
                      Get.toNamed(ChooseRideRouting.config().path);
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