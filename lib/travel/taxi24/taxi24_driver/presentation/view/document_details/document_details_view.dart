import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:api_controller/presentation/widget/cached_image_widget.dart';import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/document_details_route.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:widget_zoom/widget_zoom.dart';

class DocumentDetailsView extends StatefulWidget {
  const DocumentDetailsView({super.key});

  @override
  State<DocumentDetailsView> createState() => _DocumentDetailsViewState();
}

class _DocumentDetailsViewState extends State<DocumentDetailsView> {

  late String appBarTitle;
  late String image;

  @override
  void initState() {
    appBarTitle = Get.parameters[DocumentDetailsRouting.pageTitle]??'';
    image = Get.parameters[DocumentDetailsRouting.image]??'';

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: appBarTitle,
        leadingWidget: const BackButtonWidget(),
      ),
      body:WebWidth(
        child:SafeArea(
          child:  Container(
            height: double.infinity,
            width: double.infinity,
            padding:  const EdgeInsets.symmetric(vertical: 24,horizontal: 24),
            child: WidgetZoom(
              heroAnimationTag:'tag',
              zoomWidget: CachedImageWidget(
                imageUrl: image,
                errorImage: Images.appLogo,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      )

    );
  }
}
