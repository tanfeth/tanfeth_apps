


import 'package:tanfeth_apps/common/shared/routing/routing_config.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/report_problem/report_problem_view.dart';

class ReportProblemRouting extends RoutingConfig {
  ReportProblemRouting();

  static const String _path = '/ReportProblem/';
  static const String problemTitle = 'problemTitle';

  static RoutingConfig config() {
    switch (customAppFlavor.appNameEnum) {
      case AppNameEnum.taxi24Driver:
        return RoutingConfig(path: _path, widget: const ReportProblemView());
      default:
        return RoutingConfig(path: _path, widget: const ReportProblemView());
    }
  }
}





