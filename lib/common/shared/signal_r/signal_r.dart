import 'package:get/get.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';

class CustomSignalR {
  static Future<void>init() async {
    var flavorConfig = await customAppFlavor;
    final connection = HubConnectionBuilder()
        .withUrl(
            "${flavorConfig.signalR}/hub",
            HttpConnectionOptions(
              logging: (level, message) => print(message),
              transport: HttpTransportType.serverSentEvents,
            ))
        .withAutomaticReconnect()
        .build();

    Get.put(
      connection,
      permanent: true,
    );
    connection.start();
  }
}
