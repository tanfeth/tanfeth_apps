
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/web.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';

Future<void> warningBottomSheet(
    {required BuildContext context,
    String? title,
    String? buttonText,
    String content = "",
    VoidCallback? onPress}) async {
  await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return Web(context).width(
          child: Center(
            child: Wrap(
              children: [
                Container(
                  margin: EdgeInsets.all(MySizes.defaultPadding),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                        Radius.circular(MySizes.defaultPadding)),
                    child: Container(
                      color: Theme.of(context).colorScheme.surface,
                      height: 180,
                      padding: EdgeInsets.all(MySizes.defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(title ?? '',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineMedium),
                          Expanded(
                            child: Center(
                              child: Text(content,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.titleMedium),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: MySizes.defaultPadding),
                              child: TextButton(
                                  onPressed: onPress ??
                                      () async {
                                        // await Clipboard.setData(
                                        //     ClipboardData(text: content));
                                       // Navigator.pop(context);
                                        Get.back();
                                      },
                                  child: Center(
                                    child: Text(buttonText ?? LangEnum.ok.tr(),
                                        textAlign: TextAlign.center),
                                  ))),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
