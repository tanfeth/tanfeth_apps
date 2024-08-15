


import 'package:api_controller/presentation/widget/cached_image_widget.dart';
import 'package:api_controller/shared/sizes.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/document_details_route.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/vm/slide_vm.dart';

class RestaurantImagesWidget extends ConsumerStatefulWidget{
  const RestaurantImagesWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_RestaurantImagesWidget();


}

class _RestaurantImagesWidget extends ConsumerState<RestaurantImagesWidget>{

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: MySizes.borderRadius,
      child: CarouselSlider(
        items: [
          ...List.generate(
            3,
                (index) {
              return Container(
                height: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(20)
                    )
                ),
                child: InkWell(
                  onTap: (){

                  },
                  child:  GestureDetector(
                    onTap: () {
                      Get.toNamed(ImageZoomRouting.config().path,
                          parameters: {
                            ImageZoomRouting.image: index == 0 ?
                            Images.offerSlide1:
                            index == 1?
                            Images.offerSlide2:
                            Images.offerSlide3,
                            ImageZoomRouting.imageType:
                            customAppFlavor.commonEnum.imageTypeEnum.assets
                          });
                    },
                    child: SizedBox(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: CachedImageWidget(
                            fit: BoxFit.cover,
                            errorImage:index == 0 ?
                            Images.offerSlide1:
                            index == 1?
                            Images.offerSlide2:
                            Images.offerSlide3,
                            imageUrl: index == 0 ?
                            Images.offerSlide1:
                            index == 1?
                            Images.offerSlide2:
                            Images.offerSlide3,
                          ),
                        )


                    ),
                  ),
                ),
              );
            },
          )
        ],
        options: CarouselOptions(
          autoPlay: true,
          height: context.isTablet ? MySizes.buttonHeight * 5.5 :
          300,
          initialPage: 0,
          enableInfiniteScroll: true,
          viewportFraction: 0.8,
          enlargeCenterPage: false,
          onPageChanged: (index, reason) => ref.watch(feedMeSlideProvider.notifier)
              .changePageIndex(currentIndex: index),
        ),
      ),
    );
  }

}