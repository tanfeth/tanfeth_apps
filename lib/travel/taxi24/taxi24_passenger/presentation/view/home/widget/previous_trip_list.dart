import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/LocationModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/trip_cell.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/show_case.dart';



class PreviousTripList extends ConsumerStatefulWidget{
  final ScrollController? scrollController;
  const PreviousTripList({super.key, this.scrollController});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_PreviousTripList();


}

class _PreviousTripList extends ConsumerState<PreviousTripList>{


  List<LocationModel> tripList = [];


  @override
  void initState() {
    for(int i =0 ; i < 5;i ++ ){
      LocationModel locationModel  = LocationModel();
     // locationModel.locationCity = 'Dammam';
      locationModel.description = 'مطار الملك فهد الدولى';
      locationModel.isFavorite = true;
      locationModel.placeId = '1';
      locationModel.latLng =
       const LatLng(26.4683, 49.7972);
      tripList.add(locationModel);
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return   ListView.separated(
      controller: widget.scrollController??ScrollController(),
      separatorBuilder: (context, index) =>const  SizedBox(height: 12,),
      itemBuilder: (context, index) {
        if(index == 0){
          return Showcase(
            key: showcaseKey15,
            description: LangEnum.previousTripsHint.tr(),
            child: InkWell(
              onTap: () async{
                ref.read(destinationListProvider.notifier)
                    .addToList([tripList[index]]);
              },
              child: TripCell(
                  locationModel: tripList[index],
                  isRecent:true),
            ),
          );
        }else {
          return InkWell(
            onTap: () async{
              ref.read(destinationListProvider.notifier)
                  .addToList([tripList[index]]);
            },
            child: TripCell(
                locationModel: tripList[index],
                isRecent:true),
          );
        }
    },
      itemCount: tripList.length,);
  }

}