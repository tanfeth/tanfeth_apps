
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_controller/presentation/widget/shimmer_widget.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/data/model/enum/EnumModel.dart';
import 'package:tanfeth_apps/travel/common/vm/city/city_list_vm.dart';
import 'package:tanfeth_apps/travel/common/vm/city/selected_city_vm.dart';

class SelectCityWidget extends ConsumerStatefulWidget{
  const SelectCityWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectCityWidget();

}

class _SelectCityWidget extends ConsumerState<SelectCityWidget> {


  late CityListVM cityListVM;
  late SelectedCityVM selectedCityVM;
  late List<EnumModel> cityList;
  late int selectedCity;
  final searchController = TextEditingController();
   ScrollController controller  =ScrollController();

  initBuild() {
    cityListVM = ref.watch(cityListProvider.notifier);
    selectedCityVM = ref.watch(selectedCityProvider.notifier);
    cityList = ref.watch(cityListProvider);
    selectedCity = ref.watch(selectedCityProvider);
    cityListVM.initPagination(controller);
  }


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    initBuild();
    return FutureBuilder(
        future: ref.watch(cityListVM.futureProvider),
        builder: (context, snapshot) {
          var isLoading = snapshot.connectionState ==
              ConnectionState.waiting;

          return Container(
            height: 500,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                    itemCount:(isLoading ? 10 : 0) + cityList.length,
                    itemBuilder: (context,index){
                      if (index >= cityList.length){
                        return const ShimmerWidget(
                          height: 35,
                          width: double.infinity,
                          borderRadius:  BorderRadius.all(Radius.circular(8)),
                        );
                      }else{
                        return InkWell(
                          onTap: (){
                            selectedCityVM.setSelectedCity(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                cityList[index].name ?? '',
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


          /*return DropdownSearch<String>(
            selectedItem: selectedCity.isNegative ?
            "" : cityList[selectedCity].name ?? '',
            items: List.generate( (isLoading ? 1 : 0) + cityList.length,
                    (index) {
            if (index >= cityList.length){
              return  LangEnum.loadingPleaseWait.tr();
            }else {
              return cityList[index].name ?? '';
            }

            }),
            validator: Validation.notEmpty,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                  filled: true,
                  suffixIconColor: context.color.onPrimaryContainer,
                  labelText: LangEnum.city.tr(),
                  labelStyle: TextStyle(
                    color: context.color.onPrimaryContainer,
                  )
              ),
            ),
            popupProps: PopupPropsMultiSelection.menu(
              emptyBuilder: (context, searchEntry) =>
                  Center(child: Text(LangEnum.noData.tr())),
              showSearchBox: true,
              fit: FlexFit.loose,
              menuProps: MenuProps(backgroundColor: context.color.surface),
            ),
            onChanged: (value) {
              int index = cityList.indexWhere((item) =>
              (item.name ?? '') == value);
              selectedCityVM.setSelectedCity(index);
            },
          );*/
        }
    );
  }

}