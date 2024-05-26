import 'package:file_picker/file_picker.dart';

class AttachmentModel {
  final String path;
  final bool isImage;
  final bool isLocal;
  final int? id;
  final PlatformFile? file;

  AttachmentModel(
      {required this.path,
      required this.isImage,
      required this.isLocal,
      this.id,
      this.file});
}
