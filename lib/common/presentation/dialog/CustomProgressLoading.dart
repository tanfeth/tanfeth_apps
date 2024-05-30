
import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';

class CustomProgressLoading {
  Widget showFullDialog(BuildContext context) {
    return Center(
      child: Container(
        child: Center(
          child: Container(
            height: 50,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(MySizes.defaultPadding / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MySizes.defaultPadding),
                        child: Text(LangEnum.loadingPleaseWait.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary))),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget showIndicator(context, {Color? color, double weight = 3.0}) {
    if (color == null) color = Theme.of(context).colorScheme.primary;
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: weight,
        valueColor: new AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }

  showAlertLoaderDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: showIndicator(context),
        );
      },
    );
  }
}
