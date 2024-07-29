


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/EmptyResult.dart';
import 'package:api_controller/presentation/widget/shimmer_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/data/model/enum/EnumModel.dart';
import 'package:tanfeth_apps/travel/common/vm/gender/gender_list_vm.dart';
import 'package:tanfeth_apps/travel/common/vm/gender/selected_gender_vm.dart';

class GenderWidget extends ConsumerStatefulWidget{
  const GenderWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GenderWidget();


}

class _GenderWidget extends ConsumerState<GenderWidget>{

  late GenderListVM genderListVM ;
  late List<EnumModel> genderList ;
   late SelectedGenderVM selectedGenderVM;
   late int  selectedGender;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  initBuild(){
    genderListVM = ref.watch(genderListProvider.notifier);
    genderList = ref.watch(genderListProvider);
    selectedGenderVM = ref.watch(selectedGenderProvider.notifier);
    selectedGender = ref.watch(selectedGenderProvider);
  }


  @override
  Widget build(BuildContext context) {
    initBuild();
    return SizedBox(
      height: 50,
      child: FutureBuilder(
          future: ref.watch(genderListVM.futureProvider),
          builder: (context,snapshot){
            var isLoading = snapshot.connectionState ==
                ConnectionState.waiting;
            if(genderList.isEmpty && !isLoading){
              return EmptyResult(
                text: LangEnum.noData.tr(),
              );
            }else {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    if (index >= genderList.length){
                      return const ShimmerWidget(
                        height: 48,
                        width: 100,
                        borderRadius:  BorderRadius.all(Radius.circular(15)),
                      );

                    }else {
                      return InkWell(
                        onTap:(){
                          selectedGenderVM.setSelectedGender(index);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: 100,
                          decoration: BoxDecoration(
                              color:selectedGender == index? context.color.primary:null,
                              borderRadius: BorderRadius.circular(8),
                              border: selectedGender == index? null:Border.all(
                                  color: context.color.surfaceContainerHighest)
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child:Text(
                                genderList[index].name??'',
                              )
                          ),
                        ),
                      );
                    }

                  },
                  separatorBuilder: (context, index) => const  SizedBox(width: 8,),
                  itemCount: (isLoading ? 2 : 0) + genderList.length,);
            }
          }
      ),
    );


  }

}