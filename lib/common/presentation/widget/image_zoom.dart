import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:api_controller/presentation/widget/cached_image_widget.dart';import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/document_details_route.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:widget_zoom/widget_zoom.dart';

class ImageZoomView extends StatefulWidget {
  const ImageZoomView({super.key});

  @override
  State<ImageZoomView> createState() => _ImageZoomViewState();
}

class _ImageZoomViewState extends State<ImageZoomView> {

  late String appBarTitle;
  late String image;
  late String imageType;

  @override
  void initState() {
    appBarTitle = Get.parameters[ImageZoomRouting.pageTitle]??'';
    image = Get.parameters[ImageZoomRouting.image]??'';
    imageType = Get.parameters[ImageZoomRouting.imageType]??'';

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
                zoomWidget: imageType ==
                     customAppFlavor.commonEnum.imageTypeEnum.assets?
                    Image.asset(
                        image,
                      fit: BoxFit.fill,
                    ):
                CachedImageWidget(
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
