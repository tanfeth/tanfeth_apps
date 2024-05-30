
import 'package:tanfeth_apps/common/shared/enum.dart';
import 'package:tanfeth_apps/common/shared/enums/app_store_enum.dart';

class Taxi24DriverEnum extends CommonEnum {
  Taxi24DriverEnum() : super(){
    this.appStoreEnums = AppStoreEnum(
      androidID: 'com.taxi24.driver',
      androidUrl: '',
      iosID: 'com.taxi24.driver',
      iosUrl: ''
    );
  }
}

class Taxi24DriverProjectsFilterEnum {
  static const String name = "name";
  static const String deadline = "deadline";
  static const String idDesc = "id desc";
}

enum WorkplaceProfileTabsEnum {
  overview,
  team,
}
