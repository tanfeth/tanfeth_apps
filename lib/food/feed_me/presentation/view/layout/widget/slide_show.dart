import 'package:api_controller/presentation/widget/cached_image_widget.dart';
import 'package:api_controller/presentation/widget/shimmer_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/helper_methods.dart';
import 'package:api_controller/shared/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/food/feed_me/data/model/layout/BannerModel.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/vm/slide_vm.dart';


class SlideShow extends ConsumerStatefulWidget{
  const SlideShow({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_SlideShow();

}

class _SlideShow extends ConsumerState<SlideShow>{


  var isLoading = true;
  List<BannerModel> list = [];
  late FeedMeSlideVM layoutVM;

  @override
  void initState() {
    setLoading();
    super.initState();
  }


  initBuild(){
    layoutVM  =ref.watch(feedMeSlideProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    initBuild();

    return SizedBox(
        height: 200,
        child: isLoading
            ? const ShimmerWidget()
            :
        ClipRRect(
          borderRadius: MySizes.borderRadius,
          child: CarouselSlider(
            items: [
              ...List.generate(
                list.length,
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
                        if (list[index].link != null) {
                          urlLauncher(Uri.parse(list[index].link ?? ''));
                        }
                      },
                      child: Stack(
                        children: [

                          GestureDetector(
                            onTap: () {
                              if (list[index].link != null) {
                                urlLauncher(Uri.parse(list[index].link ?? ''));
                              }
                            },
                            child: SizedBox(
                              width: double.infinity,
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: CachedImageWidget(
                                  fit: BoxFit.cover,
                                  errorImage:  index == 0?
                                  Images.slide:
                                  index == 1?
                                  Images.slide1:
                                  Images.slide2,
                                  imageUrl: list[index].image ?? '',
                                ),
                              )


                            ),
                          ),

                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child:    Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xff7c94b6),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      index == 0?
                                      Images.slide:
                                      index == 1?
                                      Images.slide1:
                                      Images.slide2,
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                  borderRadius: const BorderRadius.all( Radius.circular(50.0)),
                                  border: Border.all(
                                    color: context.color.surface,
                                    width: 5.0,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
            options: CarouselOptions(
              autoPlay: true,
              height: context.isTablet ? MySizes.buttonHeight * 5.5 : 200,
              initialPage: 0,
              enableInfiniteScroll: true,
              viewportFraction: 0.8,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) => layoutVM.changePageIndex(currentIndex: index),
            ),
          ),
        )
    );
  }

  void setLoading() async{
    list.clear();
    Future.delayed(const Duration(seconds: 1),(){
      isLoading = false;
      for(int i =0 ; i < 3;i++){
        BannerModel bannerModel = BannerModel();
        bannerModel.type = '';
        bannerModel.id = 1;
        bannerModel.image = 'slide$i.png';
        bannerModel.link = '';
        list.add(bannerModel);
      }

      setState(() {

      });
    });
  }


}