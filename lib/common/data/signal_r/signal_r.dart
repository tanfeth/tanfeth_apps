import 'package:get/get.dart';
import 'package:signalr_core/signalr_core.dart';

class SignalR<R> {
  final String _methodName;
  String? _connectionId;
  R? _response;
  final R Function(Map<String, dynamic> json) mapJson;

  SignalR(this._methodName, this.mapJson);

  Future<void> listen(Function(R? value, String? connectionId) callBack,
      {bool isListenToMe = false}) async {
    try {
      final HubConnection connection = Get.find();
      connection.on(_methodName, (responseList) {
        _connectionId = responseList?[0] ?? '';
        _response = mapJson(responseList?[1]);
        if (isListenToMe || _connectionId != connection.connectionId)
          callBack(_response, _connectionId);
      });
    } catch (e) {}
  }

  void removeListener() {
    return;
    // try {
    //   final HubConnection connection = Get.find();
    //   connection.off(_methodName);
    // } catch (e) {}
  }
}
