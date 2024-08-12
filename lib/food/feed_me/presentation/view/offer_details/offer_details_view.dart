

import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/offer_details/offer_details_header_widget.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';

class OfferDetailsView extends ConsumerStatefulWidget{
  const OfferDetailsView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_OfferDetailsView();

}

class _OfferDetailsView extends ConsumerState<OfferDetailsView>{
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: MainAppBar(
        title: 'سماش برجر',
        leadingWidget: const BackButtonWidget(),
        appBarColor: context.color.primary,
        trailingWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.share,
            size: 25,
              color: context.color.onPrimary,
          ),
        ),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Column(
            children: [
              10.ph,
              const OfferDetailsHeaderWidget(),

            ],
          ),
        ),
      ),
    );
  }

}