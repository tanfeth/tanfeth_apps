import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/LocationModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/destination_cell.dart';


class DestinationList extends ConsumerStatefulWidget{
  final ScrollController? scrollController;
  const DestinationList({this.scrollController});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_DestinationList();

}

class _DestinationList extends ConsumerState<DestinationList>{

  List<LocationModel> destinationList = [];


  @override
  void initState() {
     for(int i =0 ; i < 3;i ++ ){
       LocationModel locationModel  = LocationModel();
       locationModel.locationCity = 'Dammam';
       locationModel.description = 'description';
       locationModel.isFavorite = true;
       locationModel.placeId = '1';
       destinationList.add(locationModel);
     }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return       ListView.separated(
      controller: widget.scrollController??ScrollController(),
      separatorBuilder: (context, index) =>const  SizedBox(height: 12,),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () async{
            },
            child: DestinationCell(
              locationModel: destinationList[index],
                isRecent:true),
                   );},
      itemCount: destinationList.length,);
  }

}