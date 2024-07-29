import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';

class DropDownMenuSearch extends StatelessWidget {
  final List items;
  final String hint;
  final String? title;
  final Function onChanged;
  final Function validator;
  final dynamic selectedItem;
  final double radius;
  final bool showSearchBox;
  final bool isDisable;

  const DropDownMenuSearch(
      {required this.items,
      required this.hint,
      this.title,
      required this.onChanged,
      required this.validator,
      this.selectedItem,
      required this.radius,
      this.showSearchBox = false,
      this.isDisable = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<dynamic>(
        enabled: isDisable,
        validator: (value) => validator(value),
        selectedItem: selectedItem,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: context.color.surface,
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                    color: context.color.surfaceContainerHighest, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                    color: context.color.surfaceContainerHighest, width: 2)),
            errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                    color: context.color.surfaceContainerHighest, width: 2)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                    color: context.color.surfaceContainerHighest, width: 2)),
            disabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: context.color.surface, width: 2)),
            hintStyle: TextStyle(
                color: context.color.surfaceContainerHighest, fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          ),
        ),
        compareFn: (item, sItem) => item == sItem,
        dropdownButtonProps: DropdownButtonProps(
            icon: SvgPicture.asset(
          Images.downArrow,
          colorFilter: ColorFilter.mode(
              context.color.surfaceContainerHighest, BlendMode.srcIn),
        )),
        popupProps: PopupProps.modalBottomSheet(
          containerBuilder: (ctx, popupWidget) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.ph,
                const Center(child: CloseBottomSheetWidget()),
                15.ph,

                if (title != null)
                  Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      child: Text(
                        title ?? '',
                        style: TextStyle(color: context.color.onSurface),
                      )),
                Flexible(
                  child: popupWidget,
                ),

                Center(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.back();
                    },
                    child: Center(
                        child: Text(
                          LangEnum.close.tr(),
                          style: context.text.titleLarge,
                        )
                    ),
                  ),
                ),

                10.ph,
              ],
            );
          },
          constraints: BoxConstraints(maxHeight: Get.height - 200),
          showSearchBox: showSearchBox,
          itemBuilder: _customPopupItemBuilder,
          showSelectedItems: true,
          modalBottomSheetProps: ModalBottomSheetProps(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24))),
            backgroundColor: context.color.surface,
            elevation: 0,
          ),
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: context.color.onSurface,
                  size: 24,
                ),
                hintText: LangEnum.searchCarType.tr(),
                hintStyle: TextStyle(
                    color: context.color.surfaceContainerHighest, fontSize: 14),
                border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        color: context.color.surfaceContainerHighest,
                        width: 2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        color: context.color.surfaceContainerHighest,
                        width: 2)),
                errorBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        color: context.color.surfaceContainerHighest,
                        width: 2)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        color: context.color.surfaceContainerHighest,
                        width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        color: context.color.surfaceContainerHighest,
                        width: 2)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
          ),
        ),
        items: items,
        onChanged: (value) => onChanged(value));
  }

  Widget _customPopupItemBuilder(BuildContext context, item, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  item,
                  style: TextStyle(color: context.color.onSurface),
                )),
          ),
          Container(
            height: 20,
            width: 20,
            alignment: Alignment.center,
            decoration: !isSelected
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: context.color.surface, width: 2))
                : BoxDecoration(
                    color: context.color.onSurface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: context.color.primary, width: 6)),
          ),
        ],
      ),
    );
  }
}
