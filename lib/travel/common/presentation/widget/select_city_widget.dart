
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/drop_down_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:dropdown_search/dropdown_search.dart';

class SelectCityWidget extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectCityWidget();

}

class _SelectCityWidget extends ConsumerState<SelectCityWidget>{


  List<String> cityList = [
    'Dammam'
  ];
  String selectedCity = '';



  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return    DropdownSearch(
      selectedItem: selectedCity,
      items: List.generate(cityList.length, (index) {
        return cityList[index];
      }),
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
        selectedCity = value;
        setState(() {});
      },
    );
  }






}