import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:tanfeth_apps/common/presentation/widget/more_cell.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/picker_helper.dart';



class PickImageBottomSheetContent extends StatelessWidget {
  final Function(File? image) pickImage;
  const PickImageBottomSheetContent({super.key,
   required this.pickImage});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: (0,MediaQuery.of(context).viewInsets.bottom,0,0).toOnly,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.ph,
            const Center(child: CloseBottomSheetWidget()),
            15.ph,
            MoreCell(
                isLast: false,
                icon: LineIcons.camera,
                text: LangEnum.takePhoto.tr(),
                onTap: () async {
                  Get.back();
                  final image = await AppPicker.image(ImageSource.camera);
                  if (image != null) {
                    pickImage.call(image);
                  }
                }),
            MoreCell(
              isLast: true,
              icon: LineIcons.image,
              text: LangEnum.uploadPhoto.tr(),
              onTap: () async {
                Get.back();
                final image = await AppPicker.image(ImageSource.gallery);
                if (image != null) {
                  pickImage.call(image);
                }
              },
            ),
            30.ph,
          ],
        ),
      )
    );
  }
}
