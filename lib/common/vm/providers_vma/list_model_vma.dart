
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/data/model/pagination_model/PaginationModel.dart';
import 'package:tanfeth_apps/common/network/network/api/api_response.dart';
import 'package:tanfeth_apps/common/vm/pagination/pagination_vm.dart';
import 'package:tanfeth_apps/common/vm/providers_vma/future_vma.dart';

abstract class ListNotifierVMA<Model, Response, Notifier>
    extends StateNotifier<List<Notifier>>
    with FutureVMA<PaginationModel<List<Response>>> {
  Ref get ref;

  PaginationVM? paginationVM;

  Pagination? pagination;

  ListNotifierVMA({required List<Notifier> state}) : super(state);

  void getList({String pageNumber = "1"});

  void clearList() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      state = [];
    });
  }

  void initPagination(ScrollController scrollController) {
    paginationVM = PaginationVM(onNextPage: (currentPage) {
      getList(pageNumber: (currentPage).toString());
    })
      ..scrollController = scrollController;
  }

  void addToList(List<Model> list) {
    refreshList(list as List<Notifier>);
  }

  void responseResult(List<Response> response) {
    if (pagination?.currentPage == 1) {
      state = [];
    }
    addToList(response as List<Model>);
  }

  void removeFromList(Model? model) {
    if (model == null) {
      return;
    } else {
      state.remove(model);
    }
    refreshList([]);
  }

  void removeFromListByIndex(int index) {
    state.removeAt(index);
    refreshList([]);
  }

  void refreshList(List<Notifier> list, {bool atFirst = false}) {
    if (atFirst) {
      state = [...list, ...state];
    } else {
      state = [...state, ...list];
    }
  }

  void setPagination(Pagination pagination) {
    this.pagination = pagination;
    paginationVM?.listener(pagination);
  }

  @override
  Future<void> refresh(
      {required Future<PaginationModel<List<Response>>>? future,
      required AutoDisposeStateNotifierProviderRef ref,
      bool isCaching = true,
      bool isAbstract = false,
      bool isOnPress = false}) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      super.refresh(
          future: future,
          ref: ref,
          isCaching: isCaching,
          isAbstract: isAbstract);
      try {
        var result = await future;
        if (result != null) {
          setPagination(result.pagination);
          responseResult(result.response);
        }
      } catch (e) {
        throw e.toString();
      }
    });
  }
}
