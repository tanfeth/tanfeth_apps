


import 'package:flutter/material.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';

class SearchingDriverWidget extends StatelessWidget {
  const SearchingDriverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LangEnum.findingDriverForYou.tr(),
          style: context.text.titleMedium,
        ),


        Padding(
          padding: EdgeInsets.symmetric( vertical: 24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              minHeight: 8,
              color: context.color.primary,
              backgroundColor:context.color.primary.withOpacity(0.3) ,
            ),
          ),
        ),

      ],
    );
  }
}
