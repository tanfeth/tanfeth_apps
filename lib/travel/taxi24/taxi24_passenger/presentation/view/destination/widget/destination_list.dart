import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/LocationModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/trip_cell.dart';


class DestinationList extends ConsumerStatefulWidget{
  const DestinationList();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_DestinationList();

}

class _DestinationList extends ConsumerState<DestinationList>{



  late DestinationListVM destinationListVM;
  late  List<LocationModel> destinationList;


  initBuild(){
    destinationListVM = ref.watch(destinationListProvider.notifier);
    destinationList = ref.watch(destinationListProvider);
  }

  @override
  void initState() {
    destinationListVM = ref.read(destinationListProvider.notifier);
    //destinationListVM.clearList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    initBuild();

    return ReorderableListView(
      children: <Widget>[
        for (int index = 0; index < destinationList.length; index += 1)
          ReorderableDragStartListener(
            key: ValueKey<int>(index),
            index: index,
            child: ListTile(
              key: Key('$index'),
              title: Text('${destinationList[index].locationCity??''}'),
               subtitle: Text('${destinationList[index].description??''}',
               style: TextStyle(
                 color: context.color.surfaceContainerHighest
               ),),
              leading:ReorderableDragStartListener(
                key: ValueKey<int>(index),
                index: index,
                child:  Icon(Icons.drag_handle,
                  color: context.color.primary,),
              ),
              trailing: GestureDetector(
                onTap: (){
                  destinationListVM.removeFromListByIndex(index);
                },
                child: Icon(
                  Icons.close,
                  color: context.color.error,
                  size: 20,
                ),
              ),
            ),
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final  item = destinationList.removeAt(oldIndex);
          destinationListVM.insertToList(newIndex, item);

      },
    );
  }

}