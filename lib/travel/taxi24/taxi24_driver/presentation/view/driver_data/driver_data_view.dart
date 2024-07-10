
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/car_detalis_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/driver_data/widget/driver_data_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/driver_data/widget/help_widget.dart';

class DriverDataView extends ConsumerStatefulWidget{
  const DriverDataView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_DriverDataView();

}

class _DriverDataView extends ConsumerState<DriverDataView>{

  DateTime backPressDateTime = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        final timeGap = DateTime.now().difference(backPressDateTime);
        final cantExit = timeGap >= const Duration(seconds: 2);
        backPressDateTime = DateTime.now();
        if (cantExit) {
          showToast(LangEnum.pressAgainToExit.tr(),
              position: ToastPosition.bottom);
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        appBar: const MainAppBar(
          trailingWidget:HelpWidget(),
        ),
        body: WebWidth(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  const EdgeInsets.symmetric(vertical: 8,),
                          child: Text(
                            "${LangEnum.welcome.tr()} ${'Abdelrhman'}",
                            style: context.text.titleMedium,
                            textAlign: TextAlign.start,
                          )
                        ),

                        Text(
                            LangEnum.completeStepsFinishEnrollment.tr(),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 24,),
                        DriverDataWidget(
                          image: Images.personSVG,
                          title: LangEnum.personalPhoto.tr(),
                          state: customAppFlavor.commonEnum.driverStateEnum.approved,
                          function: () {},
                        ),
                        DriverDataWidget(
                            image: Images.fileSVG,
                            title: LangEnum.saudiID.tr(),
                            state: customAppFlavor.commonEnum.driverStateEnum.approved,
                            function: () {},),
                        DriverDataWidget(
                            image: Images.fileSVG,
                            title: LangEnum.drivingLicence.tr(),
                            state: customAppFlavor.commonEnum.driverStateEnum.approved,
                            function: () {},),

                        DriverDataWidget(
                            image: Images.driverCarSVG,
                            title: LangEnum.carDetails.tr(),
                          state: customAppFlavor.commonEnum.driverStateEnum.approved,
                          function: () {
                              Get.toNamed(CarDetailsRouting.config().path);
                          },),

                        DriverDataWidget(
                            image: Images.fileSVG,
                            state: customAppFlavor.commonEnum.driverStateEnum.approved,
                            title: LangEnum.vehicleRegistration.tr(),
                            function: () {}),

                        DriverDataWidget(
                            image: Images.fileSVG,
                            state: customAppFlavor.commonEnum.driverStateEnum.approved,
                            title: LangEnum.vehicleInsurance.tr(),
                            function: () {}),
                      ],
                    ),
                  ),


                  ElevatedButton(
                    onPressed: () {

                    },
                    child: Text(LangEnum.send.tr()),
                  ),
                  20.ph
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}