

import 'package:api_controller/shared/web_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';

class ComplainAndSuggestView extends ConsumerStatefulWidget{
  const ComplainAndSuggestView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_ComplainAndSuggestView();


}

class _ComplainAndSuggestView extends ConsumerState<ComplainAndSuggestView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.complainAndSuggestion.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: const WebWidth(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(),
          ),
        ),
      ),
    );
  }

}