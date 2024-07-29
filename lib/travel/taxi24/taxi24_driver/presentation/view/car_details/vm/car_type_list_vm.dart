
import 'package:api_controller/model/base_model/ParamBaseModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/vm/providers_vma/list_model_vma.dart';
import 'package:tanfeth_apps/travel/common/data/model/enum/EnumModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/repo/car/car_repo.dart';



final carTypeListProvider =
AutoDisposeStateNotifierProvider<CarTypeListVM, List<EnumModel>>((ref) {
  ref.keepAlive();
  return CarTypeListVM(ref: ref);
});

class CarTypeListVM
    extends ListNotifierVMA<EnumModel, EnumModel, EnumModel> {
  @override
  final AutoDisposeStateNotifierProviderRef ref;

  ParamBaseModel paramBaseModel  = ParamBaseModel();


  CarTypeListVM({required this.ref}) : super(state: []) ;


  @override
  void getList({String? pageNumber}) async {
    if(pageNumber != null){
      paramBaseModel.pageNumber = pageNumber;
    }
    refresh(
      future: getCarTypesApi(),
      ref: ref,
    );
  }
}
