



import 'package:api_controller/presentation/widget/shimmer_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/food/feed_me/data/model/offers/OfferModel.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/layout/widget/slide_show.dart';
import 'package:tanfeth_apps/food/feed_me/presentation/view/offers/widget/offer_cell.dart';

class OffersView extends ConsumerStatefulWidget{
  const OffersView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_OffersView();

}

class _OffersView extends ConsumerState<OffersView>{

  late bool isLoading ;
  List<OfferModel> offerList = [];



  @override
  void initState() {
    setOfferList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        15.ph,
        const SlideShow(),
        15.ph,

        Expanded(
          child: ListView.separated(
              itemBuilder: (context,index){
                if(isLoading){
                  return  Container(
                    height: 130,
                    margin: const EdgeInsets.all(10),
                    child: const ShimmerWidget(),
                  );
                }else {
                  return OfferCell(
                    model:offerList[index]
                  );
                }
              },
              separatorBuilder: (context, index) => 15.ph,
              itemCount: isLoading?
                   7:offerList.length
          ),
        ),

      ],
    );
  }

  void setOfferList() {
    isLoading = true;

    for(int i= 0 ; i < 10 ; i++){
      OfferModel  model = OfferModel();
      model.name = 'بايسون برجر';
      model.image = Images.offer;
      model.description = 'بايسون برجر عامل عروض بتبدا من 20  ريال';
      offerList.add(model);
    }

    Future.delayed(const Duration(seconds: 1),(){});
    isLoading = false;
    setState(() {});
  }

}