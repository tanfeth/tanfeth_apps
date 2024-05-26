
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/data/model/pagination_model/PaginationModel.dart';
import 'package:tanfeth_apps/common/vm/providers_vma/list_model_vma.dart';

class AccountListVM<M> extends ListNotifierVMA<M, M, M> {
  final AutoDisposeStateNotifierProviderRef ref;

  AccountListVM(this.ref) : super(state: []);

  @override
  addToList(List<M> model) {
    refreshList(model);
  }

  @override
  void responseResult(List<M> response) {
    addToList(response);
  }

  void getAccountsList({required Future<PaginationModel<List<M>>> api}) {
    refresh(future: api, ref: ref, isCaching: false);
  }

  @override
  void getList({String pageNumber = "1"}) {}
}
