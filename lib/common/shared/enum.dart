
import 'package:flutter/foundation.dart';
import 'package:tanfeth_apps/common/shared/enums/language_enum.dart';
import 'package:tanfeth_apps/common/shared/enums/login_way_enum.dart';
import 'package:tanfeth_apps/travel/common/shared/enum/app_data_enum.dart';
import 'package:tanfeth_apps/travel/common/shared/enum/car_data_enum.dart';
import 'package:tanfeth_apps/travel/common/shared/enum/country_ios_code_enum.dart';
import 'package:tanfeth_apps/travel/common/shared/enum/driver_state_enum.dart';
import 'package:tanfeth_apps/travel/common/shared/enum/location_type_enum.dart';
import 'package:tanfeth_apps/travel/common/shared/enum/payment_method_enum.dart';
import 'enums/app_store_enum.dart';
import 'enums/entity_type_enum.dart';
import 'enums/follow_enum.dart';
import 'enums/gender_enum.dart';
import 'enums/login_by_enum.dart';
import 'enums/map_enum.dart';
import 'enums/order_status_enum.dart';
import 'enums/order_types_enum.dart';
import 'enums/package_enum.dart';
import 'enums/payment_method_enum.dart';
import 'enums/services_enum.dart';
import 'enums/sort_enum.dart';
import 'enums/tap_enum.dart';
import 'enums/time_enum.dart';
import 'enums/transfer-method_enum.dart';
import 'enums/type_address_enum.dart';
import 'enums/type_order_enum.dart';
import 'enums/user_status_enum.dart';
import 'enums/verify_enum.dart';
import 'enums/verify_type_by_enum.dart';
import 'enums/wallet_enum.dart';

class CommonEnum {
  LoginWayEnum loginWayEnum;
  LanguageEnum languageEnum;
  LoginByEnum loginByEnum;
  VerifyTypeByEnum verifyTypeByEnum;
  MapEnums mapEnums;
  VerifyEnum verifyEnum;
  FollowUserByEnum followEnum;
  OrderStatusEnum orderStatusEnum;
  OrderTypesEnum orderTypesEnum;
  SortEnum sortEnum;
  TransferMethodEnum transferMethodEnum;
  WalletHistoryEnum walletHistoryEnum;
  ServicesPriceEnum servicesPriceEnum;
  ShippingPackagesEnum shippingPackagesEnum;
  TypeAddressByEnum typeAddressByEnum;
  PaymentMethodByEnum paymentMethodByEnum;
  AppStoreEnum appStoreEnums;
  TypeOrderByEnum typeOrderByEnum;
  TapsEnum tapsEnum;
  TimeEnum timeEnum;
  EntityTypeEnum entityTypeEnum;
  UserStatusEnum userStatusEnum;
  GenderEnum genderEnum;
  DriverStateEnum driverStateEnum;
  AppDataEnum appDataEnum;
  CarDataEnum carDataEnum;
  CountryIosCodeEnum countryIosCodeEnum;
  LocationTypeEnum locationTypeEnum;
  PaymentMethodEnum paymentMethodEnum;

  CommonEnum({
    this.loginWayEnum = const LoginWayEnum(),
    this.languageEnum = const LanguageEnum(),
    this.loginByEnum = const LoginByEnum(),
    this.verifyTypeByEnum = const VerifyTypeByEnum(),
    this.mapEnums = const MapEnums(),
    this.verifyEnum = const VerifyEnum(),
    this.followEnum = const FollowUserByEnum(),
    this.orderStatusEnum = const OrderStatusEnum(),
    this.sortEnum = const SortEnum(),
    this.orderTypesEnum = const OrderTypesEnum(),
    this.transferMethodEnum = const TransferMethodEnum(),
    this.shippingPackagesEnum = const ShippingPackagesEnum(),
    this.servicesPriceEnum = const ServicesPriceEnum(),
    this.walletHistoryEnum = const WalletHistoryEnum(),
    this.typeAddressByEnum = const TypeAddressByEnum(),
    this.paymentMethodByEnum = const PaymentMethodByEnum(),
    this.appStoreEnums = const AppStoreEnum(),
    this.typeOrderByEnum = const TypeOrderByEnum(),
    this.tapsEnum = const TapsEnum(),
    this.timeEnum = const TimeEnum(),
    this.entityTypeEnum = const EntityTypeEnum(),
    this.userStatusEnum = const UserStatusEnum(),
    this.genderEnum = const GenderEnum(),
    this.driverStateEnum = const DriverStateEnum(),
    this.appDataEnum = const AppDataEnum(),
    this.carDataEnum = const CarDataEnum(),
    this.countryIosCodeEnum  = const CountryIosCodeEnum(),
    this.locationTypeEnum = const LocationTypeEnum(),
    this.paymentMethodEnum = const PaymentMethodEnum(),
  });
}



bool isProduction =
    const String.fromEnvironment("staging").isNotEmpty ||
        kReleaseMode;

class SharedPreferenceKeys {
  static const String isLogin = "Token";
  static const String isIntro = "Intro";
  static const String tokenString = "TokenString";
  static const String themeMode = "ThemeMode";
  static const String fkWorkSpace = "FkWorkSpace";
}

class WeekDaysEnum {
  static const int sunday = 0;
  static const int monday = 1;
  static const int tuesday = 2;
  static const int wednesday = 3;
  static const int thursday = 4;
  static const int friday = 5;
  static const int saturday = 6;
}

class SocialMediaLoginEnum {
  static const int Facebook = 1;
  static const int Google = 2;
  static const int Twitter = 3;
  static const int Apple = 4;
  static const int LinkedIn = 5;
  static const int Instagram = 6;
  static const int Other = 7;
}

class FileTypeEnum {
  static const String video = "video";
  static const String image = "image";
}



class NotificationEnum {
  static const String isOnline = "IsOnline";
  static const String isOffline = "IsOffline";


}

class NotificationTypeEnum {
  static const int Chat = 1;
  static const int Post = 2;
  static const int All = 3;
  static const int Dashboard = 4;
  static const int Booking = 5;
  static const int Event = 6;
  static const int Call = 7;
  static const int RenewSubscription = 9;
  static const int SendInvitation = 6;
  static const int ComplaintReply = 8;
}




class SocialMediaLinks {
  static const String facebook = "https://www.facebook.com/";
  static const String instagram = "https://www.instagram.com/";
  static const String twitter = "https://www.twitter.com/";
  static const String linkedin = "https://www.linkedin.com/";
}

class AppleDataEnum {
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String email = "email";
  static const String userId = "appleUserId";

}

class PaymobPaymentTypeEnum {
  static const int credit = 1;
  static const int mobile = 2;
  static const int koisk = 3;
}





enum TabBarEnum {
  home,
  cases,
  blog,
  notification,
  posts,
  menu,
  profile,
}
