import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/complete_trip_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/destination_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/choose_ride/vm/car_type_vm.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/vm/destination_list_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/find_driver/vm/searching_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/pick_up_location_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/toggle_animation_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/footer_car_list.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/widget/footer_pay_way_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/show_case.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/storage.dart';

class FooterWidget extends ConsumerStatefulWidget {
  const FooterWidget({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FooterWidget();
}

class _FooterWidget extends ConsumerState<FooterWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          color: context.color.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///Car list
          Expanded(
            child: Column(
              children: [
                Showcase(
                    key: showcaseKey2,
                    description: LangEnum.carCaseHint.tr(),
                    child: const FooterCarList()),

                10.ph,

                ///Pick up location
                Showcase(
                  key: showcaseKey3,
                  description: LangEnum.pickLocationCaseHint.tr(),
                  child: InkWell(
                    onTap: () {
                      ref.read(destinationListProvider.notifier).clearList();
                      ref
                          .read(toggleAnimationProvider.notifier)
                          .toggleConfirmFooterAnimate(true);
                      ref
                          .read(toggleAnimationProvider.notifier)
                          .toggleTripFooterAnimate(false);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Images.pickUp,
                            height: 20,
                            width: 20,
                          ),
                          10.pw,
                          Expanded(
                            child: Text(
                              ref.watch(pickUpLocationProvider).description ??
                                  '',
                              style: context.text.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                10.ph,

                ///Destination widget
                Showcase(
                  key: showcaseKey4,
                  description: LangEnum.destinationCaseHint.tr(),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(DestinationRouting.config().path);
                      // showBottomSheetFunction(
                      //   content: DestinationRouting.config().widget,
                      // );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Images.formFieldCircleSVG,
                                  height: 20,
                                  width: 20,
                                ),
                                20.pw,
                                if (ref
                                    .watch(destinationListProvider)
                                    .isEmpty) ...[
                                  Expanded(
                                    child: Text(
                                      LangEnum.whereToGo.tr(),
                                      style: context.text.bodyLarge,
                                    ),
                                  ),
                                ] else if (ref
                                        .watch(destinationListProvider)
                                        .length ==
                                    1) ...[
                                  Expanded(
                                    child: Text(
                                      ref
                                              .watch(destinationListProvider)[0]
                                              .description ??
                                          '',
                                      style: context.text.bodyLarge,
                                      maxLines: 2,
                                    ),
                                  ),
                                ] else ...[
                                  Expanded(
                                    child: Text(
                                      '${(ref.watch(destinationListProvider).length)} ${LangEnum.route.tr()}',
                                      style: context.text.bodyLarge,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(DestinationRouting.config().path);

                              // showBottomSheetFunction(
                              //   content: DestinationRouting.config().widget,
                              // );
                            },
                            child: Icon(
                              Icons.add,
                              size: 23,
                              color: context.color.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                10.ph,

                ///Pay way
                Showcase(
                    key: showcaseKey5,
                    description: LangEnum.payWayCaseHint.tr(),
                    disposeOnTap: true,
                    onBarrierClick: ()async{
                      await  TaxiPassengerAppStorage.showHomeTripFooterCase(false);
                    },
                    onToolTipClick: ()async{
                      await  TaxiPassengerAppStorage.showHomeTripFooterCase(false);
                    },
                    onTargetClick: ()async{
                      await  TaxiPassengerAppStorage.showHomeTripFooterCase(false);
                    },
                    child: const FooterPayWayWidget()),
              ],
            ),
          ),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    if (ref.read(destinationListProvider).isNotEmpty) {
                      ref
                          .read(toggleAnimationProvider.notifier)
                          .toggleFindDriverAnimate(true);

                      Future.delayed(const Duration(seconds: 3), () {
                        ref
                            .read(searchingProvider.notifier)
                            .changeCurrentIndex(1);
                      });
                    } else {
                      showFailed(msg: LangEnum.selectDestination.tr());
                    }
                  },
                  child: Text(LangEnum.findADriver.tr()),
                ),
              ),
              if (ref.watch(destinationListProvider).isNotEmpty)
                Row(
                  children: [
                    10.pw,
                    InkWell(
                      onTap: () {
                        Get.toNamed(CompleteTripRouting.config().path);

                        // showBottomSheetFunction(
                        //   content: CompleteTripRouting.config().widget,
                        // );
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            color: context.color.primary),
                        child: Column(
                          children: [
                            Text(
                              ref.watch(carTypeProvider) == 0 ? '50' : '70',
                              style: context.text.titleMedium
                                  ?.copyWith(color: context.color.onPrimary),
                            ),
                            Text(
                              LangEnum.sar.tr(),
                              style: TextStyle(color: context.color.onPrimary),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
            ],
          ),

          5.ph
        ],
      ),
    );
  }
}
