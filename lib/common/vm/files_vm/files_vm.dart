
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/vm/providers_vma/list_model_vma.dart';

final filesProvider =
AutoDisposeStateNotifierProvider<FilesVM, List<File>>((ref) {
  return FilesVM(ref:ref);
});


class FilesVM 
 extends ListNotifierVMA<File, File, File> {

  final AutoDisposeStateNotifierProviderRef ref;

  FilesVM({required this.ref}) : super(state: []) ;

  @override
  void getList({String pageNumber = "1"}) async {

  }


}