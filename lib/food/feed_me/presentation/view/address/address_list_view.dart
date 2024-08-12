


import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/common/shared/routes/add_address_route.dart';
import 'package:tanfeth_apps/food/common/shared/routes/map_route.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';

class AddressListView extends ConsumerStatefulWidget{
  const AddressListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_AddressListView();


}

class _AddressListView extends ConsumerState<AddressListView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.addresses.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [

                30.ph,
                Expanded(
                  child: ListView.separated(
                      itemBuilder:(context,index){
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(width: 1,
                            color: context.color.onSurface)
                          ),
                          child: InkWell(
                            splashColor: context.color.surface,
                            onTap: (){
                              Get.toNamed(AddAddressRouting.config().path,
                              parameters: {
                                AddAddressRouting.pageType:
                                    customAppFlavor.commonEnum.typeAddressByEnum.editAddress
                              });
                            },
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'الدمام - السعودية'
                                  ),
                                ),

                                Icon(
                                  Icons.edit,
                                  size: 25,
                                    color: context.color.primary,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => 10.ph,
                      itemCount: 3),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 15),
                  child: ElevatedButton(
                    onPressed: () async {
                      Get.toNamed(MapRouting.config().path);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          size: 25,

                        ),
                        8.pw,
                        Text(LangEnum.addNewAddress.tr()),
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

}