import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:api_controller/presentation/widget/divider.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:api_controller/vm/langauge/langauge_vm.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/chart.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/analytics_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/AnalyticsModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/analytics/widget/analytics_row.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/analytics/widget/time_cell.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/helper_methods.dart';

class AnalyticsView extends ConsumerStatefulWidget {
  const AnalyticsView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AnalyticsView();
}

class _AnalyticsView extends ConsumerState<AnalyticsView> {
  late int selectedIndex;
  List<String> timers = [];
  String data = DateFormat('yyyy-MM-dd').format(DateTime.now().toLocal());
  AnalyticsModel analyticsModel = AnalyticsModel();

  @override
  void initState() {
    timers.addAll(
        [LangEnum.daily.tr(), LangEnum.weekly.tr(), LangEnum.monthly.tr()]);

    selectedIndex = int.parse(Get.parameters[AnalyticsRouting.index] ?? '0');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: LangEnum.analytics.tr(),
        leadingWidget: const BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              showBottomSheetFunction(
                                  content: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    10.ph,
                                    const Center(
                                        child: CloseBottomSheetWidget()),
                                    10.ph,

                                    Text(
                                      LangEnum.timeRange.tr(),
                                      style: context.text.titleMedium,
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    ListView.builder(
                                      itemCount: 3,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return TimeCell(
                                          time: timers[index],
                                          index: index,
                                          context: context,
                                        );
                                      },
                                    ),
                                    // ...List.generate(3, (index) => AnalyticsTimeCell(time: timers[index], index: index,))
                                  ],
                                ),
                              ));
                            },
                            child: Row(
                              children: [
                                Text(
                                  formatMonthDay(DateTime.parse(data),
                                      selectedIndex: 1),
                                  style: context.text.titleMedium,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                SvgPicture.asset(
                                  Images.downArrow,
                                  width: 24,
                                  height: 24,
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      '${LangEnum.sar.tr()} ${500}',
                                      style: context.text.titleMedium,
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(
                                          color: context
                                              .color.surfaceContainerHighest,
                                          width: 2)),
                                  child: SvgPicture.asset(
                                    ref.watch(languageProvider) == "en"
                                        ? Images.arrowSVG
                                        : Images.arrowLeftSVG,
                                    colorFilter: ColorFilter.mode(
                                        context.color.onSurface,
                                        BlendMode.srcIn),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              (selectedIndex == 0 &&
                                          DateTime.now().toLocal().day >
                                              DateTime.parse(data)
                                                  .toLocal()
                                                  .day) ||
                                      (selectedIndex == 1 &&
                                          DateTime.now().toLocal().month >
                                              DateTime.parse(data)
                                                  .toLocal()
                                                  .month) ||
                                      (selectedIndex == 2 &&
                                          DateTime.now().toLocal().weekday >
                                              DateTime.parse(data)
                                                  .toLocal()
                                                  .weekday)
                                  ? GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 48,
                                        width: 48,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            border: Border.all(
                                                color: context.color
                                                    .surfaceContainerHighest,
                                                width: 2)),
                                        child: SvgPicture.asset(
                                            ref.watch(languageProvider) == 'en'
                                                ? Images.arrowSVG
                                                : Images.arrowLeftSVG),
                                      ),
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                          color: context
                                              .color.surfaceContainerHighest,
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          border: Border.all(
                                              color: context.color
                                                  .surfaceContainerHighest,
                                              width: 2)),
                                      child: SvgPicture.asset(
                                          ref.watch(languageProvider) == 'en'
                                              ? Images.arrowSVG
                                              : Images.arrowLeftSVG),
                                    ),
                            ],
                          ),
                          SizedBox(
                            height: 38,
                          ),
                          AspectRatio(
                              aspectRatio: 2.5,
                              child: Chart(
                                title: (analyticsModel.analysis ?? [])
                                    .map((e) => e.key.toString().length > 3
                                        ? (e.key ?? '').substring(0, 3)
                                        : (e.key ?? ''))
                                    .toList(),
                                values: (analyticsModel.analysis ?? [])
                                    .map((e) => (e.value ?? []))
                                    .toList(),
                                multivalued: selectedIndex == 2 ? true : false,
                              )),
                          SizedBox(
                            height: 42,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  LangEnum.trips.tr(),
                                  style: context.text.titleMedium,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Text(
                                LangEnum.trips.tr(),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  LangEnum.workHours.tr(),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Text(
                                "NA",
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    LargeDivider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                LangEnum.breakDown.tr(),
                                textAlign: TextAlign.start,
                                style: context.text.titleMedium,
                              )),
                          AnalyticsRow(
                            title: LangEnum.netEarnings.tr(),
                            price: '${LangEnum.sar.tr()} ${50}',
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: AnalyticsRow(
                              title: LangEnum.tip.tr(),
                              price: '${LangEnum.sar.tr()} ${60}',
                            ),
                          ),
                          AnalyticsRow(
                              title: LangEnum.cancelFees.tr(),
                              price: '-${LangEnum.sar.tr()} ${80}',
                              colorPrice: context.color.error),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: LargeDivider(),
                          ),
                          AnalyticsRow(
                            title: LangEnum.totalEarnings.tr(),
                            price: '${LangEnum.sar.tr()} ${100}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
