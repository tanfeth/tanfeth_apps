
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/data/model/base_model/ParamBaseModel.dart';
import 'package:tanfeth_apps/common/vm/providers_vma/list_model_vma.dart';
import 'package:tanfeth_apps/travel/common/data/model/enum/EnumModel.dart';
import 'package:tanfeth_apps/travel/common/data/repo/city/city_repo.dart';



final cityListProvider =
AutoDisposeStateNotifierProvider<CityListVM, List<EnumModel>>((ref) {
  return CityListVM(ref: ref);
});

class CityListVM
    extends ListNotifierVMA<EnumModel, EnumModel, EnumModel> {
  @override
  final AutoDisposeStateNotifierProviderRef ref;

  ParamBaseModel paramBaseModel  = ParamBaseModel();


  CityListVM({required this.ref}) : super(state: []) {
    getList();
  }

  @override
  void getList({String? pageNumber}) async {
    if(pageNumber != null){
      paramBaseModel.pageNumber = pageNumber;
    }
    refresh(
      future: getCitiesApi(model:paramBaseModel),
      ref: ref,
    );
  }
}
