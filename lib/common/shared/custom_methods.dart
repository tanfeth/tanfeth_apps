
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';



bool get isTaxi24Driver => customAppFlavor.appNameEnum ==
    AppNameEnum.taxi24Driver;

bool get isTaxi24Client => customAppFlavor.appNameEnum ==
    AppNameEnum.taxi24Client;