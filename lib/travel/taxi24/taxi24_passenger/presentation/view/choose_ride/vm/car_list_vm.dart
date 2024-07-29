




import 'package:api_controller/vm/providers_vma/list_model_vma.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/data/model/CarTypeModel.dart';

final carListProvider = StateNotifierProvider.autoDispose<
    CarListVM, List<CarTypeModel>>((ref) {
  ref.keepAlive();
  return CarListVM(ref);
});

class CarListVM extends ListNotifierVMA<CarTypeModel,
    CarTypeModel, CarTypeModel> {
  final AutoDisposeStateNotifierProviderRef ref;

  CarListVM(this.ref) : super(state: []) ;

  @override
  void getList({String pageNumber = "1"}) {
    // TODO: implement getList
  }

  void insertToList(int index, CarTypeModel element){
    state.insert(index, element);
    state = List.from(state);
  }


  void addToMyList(List<CarTypeModel> list,bool clearList) {
    if(clearList){
      state = [];
    }
    state = list;
    super.addToList(list);
  }


}
