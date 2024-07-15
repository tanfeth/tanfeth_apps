
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/loading_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:tanfeth_apps/travel/common/data/model/enum/EnumModel.dart';
import 'package:tanfeth_apps/travel/common/shared/form_validation.dart';
import 'package:tanfeth_apps/travel/common/vm/city/city_list_vm.dart';
import 'package:tanfeth_apps/travel/common/vm/city/selected_city_vm.dart';

class SelectCityWidget extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectCityWidget();

}

class _SelectCityWidget extends ConsumerState<SelectCityWidget>{


  late CityListVM cityListVM;
  late SelectedCityVM selectedCityVM;
  late List<EnumModel> cityList;
  late int selectedCity;


  initBuild(){
    cityListVM = ref.watch(cityListProvider.notifier);
    selectedCityVM = ref.watch(selectedCityProvider.notifier);
    cityList = ref.watch(cityListProvider);
    selectedCity = ref.watch(selectedCityProvider);
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
        builder: (context,snapshot){
          var isLoading = snapshot.connectionState ==
              ConnectionState.waiting;
          if(isLoading){
            return const LoadingWidget();
          } else {
            return    DropdownSearch<String>(
              selectedItem: selectedCity.isNegative?
              "":cityList[selectedCity].name??'',
              items: List.generate(cityList.length, (index) {
                return cityList[index].name??'';
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
                int index = cityList.indexWhere((item) => (item.name ??'') == value);
                selectedCityVM.setSelectedCity(index);
              },
            );
          }
        }
    );


  }






}