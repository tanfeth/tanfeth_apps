
import 'package:api_controller/presentation/widget/cached_image_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:api_controller/shared/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/vm/slide_vm.dart';

class OfferDetailsHeaderWidget extends ConsumerStatefulWidget{
  const OfferDetailsHeaderWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_OfferDetailsHeaderWidget();


}

class _OfferDetailsHeaderWidget extends
ConsumerState<OfferDetailsHeaderWidget>{
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [


        Column(
          children: [
            ClipRRect(
              borderRadius: MySizes.borderRadius,
              child: CarouselSlider(
                items: [
                  ...List.generate(
                   3,
                        (index) {
                      return Container(
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

                            },
                            child: SizedBox(
                                width: double.infinity,
                                height: 200,
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
                  220,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.8,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) => ref.watch(feedMeSlideProvider.notifier)
                      .changePageIndex(currentIndex: index),
                ),
              ),
            ),
            8.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                    (index) => Container(
                  margin: 2.toHorizontal,
                  height: 3,
                  width: MySizes.defaultPadding,
                  decoration: BoxDecoration(
                    borderRadius: MySizes.circleBorderRadius,
                    color: ref.watch(feedMeSlideProvider) == index
                        ? context.color.primary
                        : context.color.onPrimaryContainer.withOpacity(.3),
                  ),
                ),
              ).toList(),
            ),
          ],
        )



      ],
    );
  }

}