import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart' as slidingUpPanel;
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/close_bottom_sheet_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/destination/widget/destination_list.dart';

class PreviousTrips extends ConsumerStatefulWidget {
  const PreviousTrips();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PreviousTrips();
}

class _PreviousTrips extends ConsumerState<PreviousTrips> {
  slidingUpPanel.PanelController panelController =
      slidingUpPanel.PanelController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        panelController.open();
      },
      child: slidingUpPanel.SlidingUpPanel(
        slideDirection: slidingUpPanel.SlideDirection.DOWN,
        controller: panelController,
        // margin: EdgeInsets.all(20),
        minHeight: 60,
        maxHeight: 300,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
        collapsed: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: context.color.primary,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LangEnum.previousTrips.tr(),
                    style: context.text.titleMedium
                        ?.copyWith(color: context.color.onPrimary),
                  ),
                  15.pw,
                  Image.asset(
                    Images.scroll,
                    color: context.color.onPrimary,
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
        panelBuilder: (controller) {
          return Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Expanded(child: Padding(
                  padding: EdgeInsets
                  .symmetric(horizontal: 15),
                  child: DestinationList(),
                )),
                10.ph,
                Center(child: CloseBottomSheetWidget()),
                10.ph,
              ],
            ),
          );
        },
      ),
    );
  }
}
