

import 'package:tanfeth_apps/common/data/model/auth/AccountModel.dart';
import 'package:tanfeth_apps/common/data/signal_r/signal_r.dart';

var isOnlineSignalR = SignalR<AccountModel>('IsOnline', AccountModel.fromJson);
var isOfflineSignalR =
    SignalR<AccountModel>('IsOffline', AccountModel.fromJson);
var AccountUpdatedSignalR =
    SignalR<AccountModel>('AccountUpdated', AccountModel.fromJson);
