
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:tanfeth_apps/common/shared/show_case_validation.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';



bool get isTaxi24Driver => customAppFlavor.appNameEnum ==
    AppNameEnum.taxi24Driver;

bool get isTaxi24Passenger => customAppFlavor.appNameEnum ==
    AppNameEnum.taxi24Passenger;

bool get isFeedMe => customAppFlavor.appNameEnum ==
    AppNameEnum.feedMe;


void checkCaseStatus({int? index}) {
  switch (customAppFlavor.appNameEnum) {
    case AppNameEnum.taxi24Driver:
      setTaxi24DriverShowCase(index: index??-1);
    case AppNameEnum.taxi24Passenger:
      setTaxi24PassengerShowCase(index: index??-1);
      default:
        setTaxi24DriverShowCase(index: index??-1);
  }
}


Future<String?> getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (GetPlatform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id; // unique ID on Android
  }
}
