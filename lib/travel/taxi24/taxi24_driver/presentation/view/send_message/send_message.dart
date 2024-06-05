
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/report_problem_route.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/verify/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/profile/widget/profile_item.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/small_divider.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/taxi24_driver_enum.dart';

class SendMessageView extends ConsumerStatefulWidget{
  const SendMessageView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SendMessageView();

}

class _SendMessageView extends ConsumerState<SendMessageView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: LangEnum.sendMessage.tr(),
          leadingWidget: BackButtonWidget()),
      body: WebWidth(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal:24),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ProfileCell(
                    title: LangEnum.captainProblem.tr(),
                    function: () {
                      Get.toNamed(ReportProblemRouting.config().path,
                      parameters: {
                        ReportProblemRouting.problemTitle:
                        Taxi24DriverSendMessageEnum.captainProblem
                      });
                    }),
                const SmallDivider(),

                ProfileCell(
                    title: LangEnum.walletProblem.tr(),
                    function: () {
                      Get.toNamed(ReportProblemRouting.config().path,
                          parameters: {
                            ReportProblemRouting.problemTitle:
                            Taxi24DriverSendMessageEnum.walletProblem
                          });
                    }),
                const SmallDivider(),


                ProfileCell(
                    title: LangEnum.itemProblem.tr(),
                    function: () {
                      Get.toNamed(ReportProblemRouting.config().path,
                          parameters: {
                            ReportProblemRouting.problemTitle:
                            Taxi24DriverSendMessageEnum.itemProblem
                          });
                    }),
                const SmallDivider(),


                ProfileCell(
                    title: LangEnum.other.tr(),
                    function: () {
                      Get.toNamed(ReportProblemRouting.config().path,
                          parameters: {
                            ReportProblemRouting.problemTitle:
                            Taxi24DriverSendMessageEnum.otherProblem
                          });
                    }),

              ],
            ),
          ),
        ),
      ),
    );
  }

}