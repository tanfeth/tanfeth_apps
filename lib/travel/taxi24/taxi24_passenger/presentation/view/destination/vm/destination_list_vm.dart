

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/vm/providers_vma/list_model_vma.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/LocationModel.dart';

final destinationListProvider = StateNotifierProvider.autoDispose<
    DestinationListVM, List<LocationModel>>((ref) {
  ref.keepAlive();
  return DestinationListVM(ref);
});

class DestinationListVM extends ListNotifierVMA<LocationModel,
    LocationModel, LocationModel> {
  final AutoDisposeStateNotifierProviderRef ref;

  DestinationListVM(this.ref) : super(state: []) ;

  @override
  void getList({String pageNumber = "1"}) {
    // TODO: implement getList
  }

  void insertToList(int index, LocationModel element){
    state.insert(index, element);
    state = List.from(state);
  }


  void addToMyList(List<LocationModel> list,bool clearList) {
    if(clearList){
      state = [];
    }
    state = list;
    super.addToList(list);
  }


}
