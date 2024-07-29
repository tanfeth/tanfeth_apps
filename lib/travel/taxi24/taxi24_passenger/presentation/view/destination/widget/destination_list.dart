import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/LocationModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/show_case.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/storage.dart';

class DestinationList extends ConsumerStatefulWidget{
  const DestinationList({super.key});

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
    if(TaxiPassengerAppStorage.getDestinationCase() == true){
      showCaseEvent(context: context,caseList: [
        showcaseKey16,
      ]);

    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    initBuild();

    return ReorderableListView(
      shrinkWrap: true,
      children: <Widget>[
        for (int index = 0; index < destinationList.length; index += 1)
          ReorderableDragStartListener(
            key: ValueKey<int>(index),
            index: index,
            child: getChild(index: index)
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


  Widget getChild({required int index}){
    return ListTile(
      key: Key('$index'),
      title: Text(destinationList[index].description??'',
        maxLines: 2,
        style: TextStyle(
          color: context.color.surfaceContainerHighest,
        ),),
      // subtitle: Text('${destinationList[index].description??''}',
      // style: TextStyle(
      //   color: context.color.surfaceContainerHighest
      // ),),
      leading:ReorderableDragStartListener(
        key: ValueKey<int>(index),
        index: index,
        child:  index ==0 ?
         Showcase(
             key: showcaseKey16,
             description: LangEnum.reorderListHint.tr(),
             onBarrierClick:(){
               TaxiPassengerAppStorage.showDestinationCase(false);
             },
             child:   Icon(Icons.reorder,
               color: context.color.primary,)):
        Icon(Icons.reorder,
          color: context.color.primary,),
      ),
      trailing: GestureDetector(
        onTap: (){
          destinationListVM.removeFromListByIndex(index);
        },
        child: Icon(
          Icons.playlist_remove_sharp,
          color: context.color.error,
          size: 20,
        ),
      ),
    );
  }
}