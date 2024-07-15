
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/data/model/base_model/ParamBaseModel.dart';
import 'package:tanfeth_apps/common/vm/providers_vma/list_model_vma.dart';
import 'package:tanfeth_apps/travel/common/data/model/enum/EnumModel.dart';
import 'package:tanfeth_apps/travel/common/data/repo/enum/enum_repo.dart';



final genderListProvider =
AutoDisposeStateNotifierProvider<GenderListVM, List<EnumModel>>((ref) {
  return GenderListVM(ref: ref);
});

class GenderListVM
    extends ListNotifierVMA<EnumModel, EnumModel, EnumModel> {
  @override
  final AutoDisposeStateNotifierProviderRef ref;

  ParamBaseModel paramBaseModel  = ParamBaseModel();


  GenderListVM({required this.ref}) : super(state: []) {
    getList();
  }

  @override
  void getList({String? pageNumber}) async {
    if(pageNumber != null){
      paramBaseModel.pageNumber = pageNumber;
    }
    refresh(
      future: getGenderEnumApi(model:paramBaseModel),
      ref: ref,
    );
  }
}
