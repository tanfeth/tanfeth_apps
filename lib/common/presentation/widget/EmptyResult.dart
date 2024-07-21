
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';

class EmptyResult extends ConsumerStatefulWidget {
  final String? subText;
  final String? text;

  const EmptyResult({super.key, this.text, this.subText});

  @override
  _EmptyResultState createState() => _EmptyResultState();
}

class _EmptyResultState extends ConsumerState<EmptyResult> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds:200)),
      builder: (_,snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(MySizes.defaultPadding),
                  child: Image(
                    image: AssetImage(Images.appLogo),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: MySizes.defaultPadding),
                  child: Text(widget.text != null
                      ? widget.text ?? ""
                      : (LangEnum.noFound.tr() +
                          (widget.subText ?? LangEnum.data.tr()) +
                          LangEnum.forNow.tr()),textAlign: TextAlign.center,))
            ],
          ),
        );
      }
    );
  }
}
