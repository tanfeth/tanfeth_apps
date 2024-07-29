



import 'package:api_controller/route/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/presentation/view/add_rider_instruction/add_rider_instruction_view.dart';

class AddRiderInstructionRouting extends RoutingConfig {
  AddRiderInstructionRouting();

  static const String _path = '/AddRiderInstruction/';


  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const AddRiderInstructionView());
      default:
        return RoutingConfig(path: _path, widget: const AddRiderInstructionView());
    }
  }
}

