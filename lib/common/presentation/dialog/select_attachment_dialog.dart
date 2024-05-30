
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/dialog/CustomProgressLoading.dart';
import 'package:tanfeth_apps/common/presentation/dialog/ErrorDialog.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';
import 'package:tanfeth_apps/common/vm/attachment_vm/attachment_vm.dart';

class SelectAttachmentDialog extends StatefulWidget {
  final AttachmentVM createPostFilesVM;
  final List<PlatformFile>? files;

  final bool isImage;
  final bool isVideo;
  final bool isFile;
  final bool isSound;

  SelectAttachmentDialog(
      {required this.createPostFilesVM,
      this.files,
      this.isImage = true,
      this.isVideo = true,
      this.isFile = true,
      this.isSound = false});

  @override
  State<SelectAttachmentDialog> createState() => _SelectAttachmentDialogState();
}

class _SelectAttachmentDialogState extends State<SelectAttachmentDialog> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          Container(
            padding: EdgeInsets.all(MySizes.defaultPadding),
            margin: EdgeInsets.all(MySizes.defaultPadding),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(MySizes.defaultPadding * 2)),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.isImage)
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: TextButton.icon(
                              style: Theme.of(context)
                                  .textButtonTheme
                                  .style
                                  ?.copyWith(
                                    padding: WidgetStateProperty.all(
                                        EdgeInsets.zero),
                                    backgroundColor: WidgetStateProperty.all(
                                        Colors.transparent),
                                    elevation: WidgetStateProperty.all(0),
                                  ),
                              onPressed: () {
                                getFiles(FileType.image);
                              },
                              icon: Icon(
                                Icons.image,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              label: Text(LangEnum.image.tr(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium)),
                        ),
                        Divider(
                          height: 1,
                        ),
                      ],
                    ),
                  if (widget.isVideo)
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: TextButton.icon(
                              style: Theme.of(context)
                                  .textButtonTheme
                                  .style
                                  ?.copyWith(
                                    padding: WidgetStateProperty.all(
                                        EdgeInsets.zero),
                                    backgroundColor: WidgetStateProperty.all(
                                        Colors.transparent),
                                    elevation: WidgetStateProperty.all(0),
                                  ),
                              onPressed: () {
                                getFiles(FileType.video);
                              },
                              icon: Icon(
                                Icons.video_collection,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              label: Text(LangEnum.video.tr(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium)),
                        ),
                        Divider(
                          height: 1,
                        ),
                      ],
                    ),
                  if (widget.isSound)
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: TextButton.icon(
                              style: Theme.of(context)
                                  .textButtonTheme
                                  .style!
                                  .copyWith(
                                    padding: WidgetStateProperty.all(
                                        EdgeInsets.zero),
                                    backgroundColor: WidgetStateProperty.all(
                                        Colors.transparent),
                                    elevation: WidgetStateProperty.all(0),
                                  ),
                              onPressed: () {
                                getFiles(FileType.audio);
                              },
                              icon: Icon(
                                Icons.audiotrack,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              label: Text(LangEnum.audio.tr(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium)),
                        ),
                        Divider(
                          height: 1,
                        ),
                      ],
                    ),
                  if (widget.isFile)
                    SizedBox(
                      width: double.infinity,
                      child: TextButton.icon(
                          style: Theme.of(context)
                              .textButtonTheme
                              .style!
                              .copyWith(
                                padding:
                                    WidgetStateProperty.all(EdgeInsets.zero),
                                backgroundColor: WidgetStateProperty.all(
                                    Colors.transparent),
                                elevation: WidgetStateProperty.all(0),
                              ),
                          onPressed: () {
                            getFiles(FileType.custom);
                          },
                          icon: Icon(
                            Icons.file_copy,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          label: Text(LangEnum.document.tr(),
                              style: Theme.of(context).textTheme.titleMedium)),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future getFiles(FileType fileType) async {
    Navigator.pop(context);
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          withData: true,
          allowCompression: true,
          type: fileType,
        allowedExtensions: fileType == FileType.custom?
        ['pdf', 'doc']:null,
      );
      if (result != null) {
        if(fileType == FileType.custom){
          if((result.files[0].extension??'') != 'pdf' &&
              (result.files[0].extension??'') != 'doc'){
            Fluttertoast.showToast(
                msg: LangEnum.fileTypeError.tr(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1);
          }else {
            widget.createPostFilesVM
                .addPlatformFile(result.files, fileType == FileType.image);
            widget.files?.addAll(result.files);
          }
        }else {
          widget.createPostFilesVM
              .addPlatformFile(result.files, fileType == FileType.image);
          widget.files?.addAll(result.files);
        }

      } else {
        // User canceled the picker
      }
    } catch (e) {
      ErrorDialog.show(context, title: LangEnum.uploadError.tr());
    }
  }

  Widget fileView(String fileName) {
    return Container(
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Icon(
                Icons.file_copy,
                color: Theme.of(context).colorScheme.primary,
                size: 100,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: MySizes.defaultPadding),
                  child: Text(fileName,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget imageView(String fileUrl) {
    return Image.network(
      fileUrl,
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Align(
          alignment: Alignment.center,
          child:
              SizedBox(child: CustomProgressLoading().showIndicator(context)),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(Images.appLogo,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.contain)
            .paddingAll(MySizes.defaultPadding / 2);
      },
    );
  }
}
