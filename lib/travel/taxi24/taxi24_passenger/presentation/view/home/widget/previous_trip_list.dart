import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/LocationModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/trip_cell.dart';


class PreviousTripList extends ConsumerStatefulWidget{
  final ScrollController? scrollController;
  const PreviousTripList({this.scrollController});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_PreviousTripList();


}

class _PreviousTripList extends ConsumerState<PreviousTripList>{


  List<LocationModel> tripList = [];


  @override
  void initState() {
    for(int i =0 ; i < 5;i ++ ){
      LocationModel locationModel  = LocationModel();
      locationModel.locationCity = 'Dammam';
      locationModel.description = 'description';
      locationModel.isFavorite = true;
      locationModel.placeId = '1';
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
        return GestureDetector(
          onTap: () async{
          },
          child: TripCell(
              locationModel: tripList[index],
              isRecent:true),
        );},
      itemCount: tripList.length,);
  }

}