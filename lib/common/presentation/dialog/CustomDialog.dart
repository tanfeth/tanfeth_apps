
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/theme/button_theme.dart';

showAlertDialog(BuildContext context,
    {String? content,
    String? title,
    String? approveTitle,
    String? cancelTitle,
    required Function() onApprove,
    Function()? onCancel}) {
  Widget okButton = TextButton(
    child: Text(approveTitle ?? LangEnum.ok.tr()),
    onPressed: onApprove,
  );
  Widget cancelButton = TextButton(
    style: ButtonThemes.transparentTextButton(context: context).style,
    child: Text(cancelTitle ?? LangEnum.cancel.tr(),
        style: TextStyle(color: Colors.red)),
    onPressed: onCancel ??
        () {
          Get.back();
        },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: title != null ? Text(title) : null,
    content: Text(content ?? LangEnum.areYouSure.tr()),
    actions: [
      Container(height: 40, child: okButton),
      Container(height: 40, child: cancelButton),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
