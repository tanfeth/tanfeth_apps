import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/car_details/widget/car_data.dart';

class CarDetailsView extends ConsumerStatefulWidget {
  const CarDetailsView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CarDetailsView();
}

class _CarDetailsView extends ConsumerState<CarDetailsView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.carDetails.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                children: [
                  Expanded(
                    child: CarData(
                      formKey: formKey,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        closeKeyBoard();
                      }
                    },
                    child: Text(LangEnum.send.tr()),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
