

import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:api_controller/presentation/widget/shimmer_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/data/model/enum/EnumModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/car/ParamCarModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_details/vm/car_model_list_vm.dart';



class CarModelWidget extends ConsumerStatefulWidget{
  final Function(String val) onSelected;
  final String carTypeCode;

  const CarModelWidget({super.key,
  required this.onSelected,
    required this.carTypeCode
  });
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _CarTypeWidget();
  
  
}

class _CarTypeWidget extends ConsumerState<CarModelWidget>{


  late CarModelListVM carModelListVM;
  late List<EnumModel> carModelList ;
  final searchController = TextEditingController();
  ScrollController controller  =ScrollController();
  
  
  @override
  void initState() {
    /// Get car types
    carModelListVM = ref.read(carModelListProvider.notifier);
    carModelListVM.paramCarModel = ParamCarModel();
    carModelListVM.paramCarModel.carTypeCode =
    widget.carTypeCode;
    carModelListVM.getList();
    carModelListVM.initPagination(controller);
    super.initState();
  }
  
  
  initBuild(){
    carModelListVM = ref.watch(carModelListProvider.notifier);
    carModelList = ref.watch(carModelListProvider);
  }
  
  
  @override
  Widget build(BuildContext context) {
    initBuild();
    return  FutureBuilder(
        future: ref.watch(carModelListVM.futureProvider),
        builder: (context,snapshot){
          var isLoading = snapshot.connectionState ==
              ConnectionState.waiting;

          return Container(
            height: 500,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                10.ph,
                const Center(child: CloseBottomSheetWidget()),
                10.ph,

                CustomTextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    hintText: LangEnum.search.tr(),
                    textInputAction: TextInputAction.next,
                    onChanged: (String value) {}),

                15.ph,

                Expanded(
                  child: ListView.separated(
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => const  SizedBox(height: 10,),
                    itemCount:(isLoading ? 10 : 0) + carModelList.length,
                    itemBuilder: (context,index){
                      if (index >= carModelList.length){
                        return const ShimmerWidget(
                          height: 35,
                          width: double.infinity,
                          borderRadius:  BorderRadius.all(Radius.circular(8)),
                        );
                      }else{
                        return InkWell(
                          onTap: (){
                            widget.onSelected.call(
                                carModelList[index].name??''
                            );
                            Get.back();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              carModelList[index].name ?? '',
                              style: context.text.bodyLarge,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          );
        }
    );
    
  }
  
}