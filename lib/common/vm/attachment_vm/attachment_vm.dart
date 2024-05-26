import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/data/model/attachment/attachment_model.dart';

final attachmentProvider =
    StateNotifierProvider.autoDispose<AttachmentVM, List<AttachmentModel>>(
        (ref) {
  return AttachmentVM();
});

/// control all attachment actions like {add , remove}
class AttachmentVM extends StateNotifier<List<AttachmentModel>> {
  //TODO List Notifier VMA
  AttachmentVM() : super([]);

  /// add [files] list at the end of attachment list
  addToList(List<AttachmentModel> files) {
    state = [...state, ...files];
  }

  /// remove from [state] that's mean attachment list by index
  removeFromList(int index) {
    state.removeAt(index);
    state = [...state];
  }

  /// remove from [state] that's mean attachment list by index
  removeAllList() {
    state.clear();
    state = [...state];
  }

  addPlatformFile(List<PlatformFile> files, bool isImage,
      {bool isWeb = false}) {
    if (isWeb) {
      addToList(files
          .map((e) => AttachmentModel(
              path: "", file: e, isImage: isImage, isLocal: true))
          .toList());
    } else {
      addToList(files
          .map((e) => AttachmentModel(
              path: e.path ?? "", file: e, isImage: isImage, isLocal: true))
          .toList());
    }
  }
}
