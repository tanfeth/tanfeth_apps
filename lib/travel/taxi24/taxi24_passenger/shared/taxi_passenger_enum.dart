

import 'package:api_controller/shared/enums/app_store_enum.dart';
import 'package:tanfeth_apps/common/shared/enum.dart';
import 'package:tanfeth_apps/travel/common/shared/enum/app_data_enum.dart';

class TaxiPassengerEnum extends CommonEnum {
  TaxiPassengerEnum() : super(){
    appStoreEnums = const AppStoreEnum(
        androidID: 'com.taxi24.passenger',
        androidUrl: 'https://play.google.com/store/apps/details?id=com.taxi24.passenger&hl=ar',
        iosID: '6480043050',
        iosUrl: 'https://apps.apple.com/sa/app/taxi24-passenger/id6480043050'
    );


    appDataEnum = const AppDataEnum(
        aboutApp: 'https://taxi24.app/app-features/?lang=',
        termsAndCondition: 'https://taxi24.app/terms-and-conditions/?lang=',
        policy: 'https://taxi24.app/privacy-policy/?lang='
    );
  }
}