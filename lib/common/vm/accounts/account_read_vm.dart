
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanfeth_apps/common/data/model/auth/AccountModel.dart';
import 'package:tanfeth_apps/common/data/model/auth/AuthenticateResponseModel.dart';
import 'package:tanfeth_apps/common/data/repo/user/user_repo.dart';
import 'package:tanfeth_apps/common/data/signal_r/account_signal_r.dart';
import 'package:tanfeth_apps/common/vm/providers_vma/read_model_vma.dart';


final myAccountProvider =
    StateNotifierProvider.autoDispose<AccountReadVM, AccountModel>((ref) {
  ref.keepAlive();
  var vm = AccountReadVM(ref);
  return vm;
});

final userProfileProvider =
    StateNotifierProvider.autoDispose<AccountReadVM, AccountModel>((ref) {
  var vm = AccountReadVM(ref);
  isOnlineSignalR.listen((value, connectionId) {
    vm.setModel(value ?? AccountModel());
  });
  return vm;
});

class AccountReadVM
    extends ReadNotifierVMA<AccountModel, AccountModel, AccountModel> {
  final AutoDisposeStateNotifierProviderRef ref;

  String bucToken = '';
  String busToken = '';
  int userMoodleId = -1;
  int currentCourseId = -1;
  bool? soundActive = true;


  AccountReadVM(this.ref, {AccountModel? state})
      : super(state ?? AccountModel());

  void setAuthResponse(AuthenticateResponseModel? authModel) async {
    if (authModel == null) state = AccountModel();
    state.phoneNumber = authModel?.phoneNumber;
    state.fk_AccountType = authModel?.fk_AccountType;
    state.nickName = authModel?.name;
    state.firstName = authModel?.name;
    state.id = authModel?.fk_Account ?? 0;
    state.emailAddress = authModel?.emailAddress;
    state.imageUrl = authModel?.imageUrl;
    state.fk_AccountState = authModel?.fk_AccountState ?? 0;
    state.isAdmin = authModel?.isAdmin??false;
    setModel(AccountModel.fromJson(state.toJson()));
    getProfile(fkAccount: state.id);


    _setSignalRConnection();
  }

  void _setSignalRConnection() {
    try {
      HubConnection hubConnection = Get.find();

      hubConnection.onreconnected((connectionId) {
        setConnectionId(connectionId: connectionId ?? "");
      });

      if (hubConnection.connectionId != null) {
        setConnectionId(connectionId: hubConnection.connectionId ?? "");
      }
    } catch (e) {
      e.printError();
    }
  }

  @override
  void setModel(AccountModel model) {
    super.setModel(model);
    if (state.id == 0) {
      /// de ya 7ooda ( mahmoud flutter )  34an n2fl beha l provider bta3 account lma y7sl logout aw error
      ref.keepAlive().close();
    } else {
      ref.keepAlive();
    }
  }

  void getProfile({int? fkAccount, int? uid}) async {
    refresh(
        future: getProfileApi(fkAccount: fkAccount ?? state.id, uid: uid),
        ref: ref,
        isAbstract: false);
    var response = await ref.read(futureProvider);
    if (response != null) setModel(response);
  }


  getSoundStates() {
    SharedPreferences.getInstance().then((value) {
      soundActive= value.getBool("soundActive")??true;
    });
  }

  changeSoundStatus({required bool soundStatus}){
    print(soundStatus);
    soundActive=soundStatus;
    SharedPreferences.getInstance().then((value) {
      value.setBool("soundActive",soundStatus);
    });
  }
}
