import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/data/model/ParamMapModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/home/vm/toggle_animation_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/set_location_on_map/vm/set_on_location_map_vm.dart';

class SetLocationMapWidget extends ConsumerStatefulWidget {
  final String pageType;
  const SetLocationMapWidget({required this.pageType});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SetLocationMapWidget();
}

class _SetLocationMapWidget extends ConsumerState<SetLocationMapWidget> {
  late ParamMapModel paramMapModel;
  final Completer<GoogleMapController> completer = Completer();
  late ToggleAnimationVM toggleAnimationVM;

  initBuild() {
    paramMapModel = ref.watch(setOnLocationMapProvider);
  }

  @override
  void initState() {
    toggleAnimationVM = ref.read(toggleAnimationProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initBuild();

    return GoogleMap(
      compassEnabled: false,
      mapToolbarEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      buildingsEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
          zoom: paramMapModel.mapZoom, target: paramMapModel.currentLatLng),
      onMapCreated: (GoogleMapController controller) async {
        ref
            .read(setOnLocationMapProvider.notifier)
            .updateMapController(mapController: controller);
        if (!completer.isCompleted) {
          completer.complete(controller);
        }
        await ref
            .read(setOnLocationMapProvider.notifier)
            .getAddressFromLatLong();
      },
      onCameraMove: (CameraPosition position) async {
        ref
            .read(setOnLocationMapProvider.notifier)
            .updateCameraPosition(position: position);
        if (widget.pageType ==
            customAppFlavor.commonEnum.locationTypeEnum.pickUp) {
          toggleAnimationVM.toggleHeaderAnimate(false);
          toggleAnimationVM.toggleConfirmFooterAnimate(false);
          toggleAnimationVM.toggleTripFooterAnimate(false);
        }
      },
      onCameraIdle: () async {
        await ref
            .read(setOnLocationMapProvider.notifier)
            .getAddressFromLatLong();
        if (widget.pageType ==
            customAppFlavor.commonEnum.locationTypeEnum.pickUp) {
          Future.delayed(Duration(seconds: 1), () {
            toggleAnimationVM.toggleHeaderAnimate(true);
            toggleAnimationVM.toggleConfirmFooterAnimate(true);
            toggleAnimationVM.toggleTripFooterAnimate(false);
          });
        }
      },
      onTap: (latLang) async {
        await ref.read(setOnLocationMapProvider.notifier).getAddressFromLatLong(
            lat: latLang.latitude, long: latLang.longitude);
        if (widget.pageType ==
            customAppFlavor.commonEnum.locationTypeEnum.pickUp) {
          toggleAnimationVM.toggleHeaderAnimate(false);
          toggleAnimationVM.toggleConfirmFooterAnimate(false);
          toggleAnimationVM.toggleTripFooterAnimate(false);
        }
      },
    );
  }
}
