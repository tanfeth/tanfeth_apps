
import 'package:tanfeth_apps/common/shared/show_case_validation.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';



bool get isTaxi24Driver => customAppFlavor.appNameEnum ==
    AppNameEnum.taxi24Driver;

bool get isTaxi24Passenger => customAppFlavor.appNameEnum ==
    AppNameEnum.taxi24Passenger;


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
