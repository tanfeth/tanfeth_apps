
import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';

class ErrorDialog {
  static show(
    BuildContext context, {
    String title = "",
    String? body = "",
    String buttonText = "",
  }) async {
    if (buttonText.isEmpty) buttonText = LangEnum.ok.tr();
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(MySizes.defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(MySizes.defaultPadding),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                (title.isEmpty)
                    ? SizedBox()
                    : Text(title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        )),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: MySizes.defaultPadding),
                    child: Text(body!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                        )),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(minWidth: 100),
                  child: TextButton(
                    child: Text(buttonText,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        )),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
