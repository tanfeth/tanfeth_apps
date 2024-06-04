
import 'package:tanfeth_apps/common/shared/enum.dart';
import 'package:tanfeth_apps/common/shared/enums/app_store_enum.dart';

class Taxi24DriverEnum extends CommonEnum {
  Taxi24DriverEnum() : super(){
    appStoreEnums = AppStoreEnum(
      androidID: 'com.taxi24.driver',
      androidUrl: 'https://play.google.com/store/apps/details?id=com.taxi24.driver&hl=ar',
      iosID: '6466298399',
      iosUrl: 'https://apps.apple.com/sa/app/taxi-24-driver/id6466298399'
    );
  }

}

class Taxi24DriverProjectsFilterEnum {
  static const String name = "name";
  static const String deadline = "deadline";
  static const String idDesc = "id desc";
}


class Taxi24DriverSendMessageEnum {
  static const String captainProblem = "Captain caused the ride charges to increase";
  static const String walletProblem = "I paid the captain extra but the amount is not visible in my wallet";
  static const String itemProblem = "I lost an item";
  static const String otherProblem = "Other";
}


enum SlideDirection {
  UP,
  DOWN,
}

enum PanelState { OPEN, CLOSED }
