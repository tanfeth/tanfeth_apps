
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/vm/providers_vma/list_model_vma.dart';
import 'package:tanfeth_apps/travel/common/data/model/enum/EnumModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/car/ParamCarModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/repo/car/car_repo.dart';



final carModelListProvider =
AutoDisposeStateNotifierProvider<CarModelListVM, List<EnumModel>>((ref) {
  ref.keepAlive();
  return CarModelListVM(ref: ref);
});

class CarModelListVM
    extends ListNotifierVMA<EnumModel, EnumModel, EnumModel> {
  @override
  final AutoDisposeStateNotifierProviderRef ref;

  ParamCarModel paramCarModel  = ParamCarModel();


  CarModelListVM({required this.ref}) : super(state: []) ;


  @override
  void getList({String? pageNumber}) async {
    if(pageNumber != null){
      paramCarModel.pageNumber = pageNumber;
    }
    refresh(
      future: getCarModelsApi(model: paramCarModel),
      ref: ref,
    );
  }
}
