

import 'package:api_controller/model/auth/AccountModel.dart';
import 'package:api_controller/signal_r/signal_r.dart';

var isOnlineSignalR = SignalR<AccountModel>('IsOnline', AccountModel.fromJson);
var isOfflineSignalR = SignalR<AccountModel>('IsOffline', AccountModel.fromJson);
var accountUpdatedSignalR = SignalR<AccountModel>('AccountUpdated', AccountModel.fromJson);
