

import 'package:tanfeth_apps/common/shared/enum.dart';
import 'package:tanfeth_apps/common/shared/enums/app_store_enum.dart';

class TaxiPassengerEnum extends CommonEnum {
  TaxiPassengerEnum() : super(){
    appStoreEnums = AppStoreEnum(
        androidID: 'com.taxi24.passenger',
        androidUrl: 'https://play.google.com/store/apps/details?id=com.taxi24.passenger&hl=ar',
        iosID: '6480043050',
        iosUrl: 'https://apps.apple.com/sa/app/taxi24-passenger/id6480043050'
    );
  }
}