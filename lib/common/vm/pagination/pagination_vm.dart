import 'package:flutter/cupertino.dart';
import 'package:tanfeth_apps/common/network/network/api/api_response.dart';

class PaginationVM {
  ScrollController? scrollController;
  final Function(int pageNumber) onNextPage;

  PaginationVM({required this.onNextPage(int)});

  void listener(Pagination? pagination) {
    scrollController?.addListener(() {
      if ((scrollController?.position.pixels ?? 0) >
          ((scrollController?.position.maxScrollExtent ?? 0) - 100)) {
        int currentPage = pagination?.currentPage ?? 0;
        if (pagination?.hasNext ?? false) {
          pagination?.hasNext = false;
          onNextPage(currentPage + 1);
        }
      }
    });
  }
}
