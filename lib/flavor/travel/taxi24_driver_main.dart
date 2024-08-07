


import 'package:api_controller/api/api_controller.dart';
import 'package:api_controller/api/api_enum.dart';
import 'package:api_controller/shared/grid_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/document_details_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/document_route.dart';
import 'package:tanfeth_apps/flavor/common_main.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/add_car_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/analytics_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/attachment_info_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/car_detalis_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/car_istimara_confirm_photo_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/car_istimara_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/cars_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/confirm_photo_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/driver_data_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/earning_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/payment_method_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/personal_info_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/terms_service_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/trips_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/wallet_cash_Out_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/wallet_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/end_points.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/taxi24_driver_enum.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/taxi24_driver_languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/theme/theme.dart';



class Taxi24DriverMain {

  List<GetPage> screenPages = [];

  Taxi24DriverMain() {
    minusWebWidth = 400;
    bool isStaging = const String.fromEnvironment("staging").isNotEmpty;

    final String baseUrl = kReleaseMode || isStaging
        ? "https://test.taxi24.app"
        : "https://devapi.taxi24.app";

    var flavor = FlavorConfig(
        baseUrl: baseUrl,
        appNameEnum: AppNameEnum.taxi24Driver,
        appEnum: 3,
        commonEnum: Taxi24DriverEnum(),
        myLanguages: Taxi24DriverLanguages(),
        endPoints: Taxi24DriverEndPoints(),
        appCategoryEnum: {AppCategoryEnum.travel},
        theme: Taxi24DriverTheme(),
        shareUrl: 'https://test.taxi24.app/api',
        mapApiKey: 'AIzaSyArcxVdw-9ehlF1atcclWSLBqv3UBiKMeo'
    );
    if (!(kReleaseMode || isStaging)) {
      Auth.init(
        apiKey: "IzVqc7xBjNiYQS0Nl6QXIXSX8WBsd0Hwjfe9jVQs",
        appSecret: "d1e28279-ef34-4cf8-9c17-04fd1ff9a4e9",
        refreshTokenUrl: "/v1/Auth/RefreshToken",
        revokeTokenUrl: "/v1/Auth/RevokeToken",
        secretCer: "okgOZmQDDvDxxLNMHfdQZs7WP5lFuInI",
        userAgent:UserAgentEnum.android,
      );
    } else {
      Auth.init(
        apiKey: "IzVqc7xBjNiYQS0Nl6QXIXSX8WBsd0Hwjfe9jVQs",
        appSecret: "d1e28279-ef34-4cf8-9c17-04fd1ff9a4e9",
        refreshTokenUrl: "/v1/Auth/RefreshToken",
        revokeTokenUrl: "/v1/Auth/RevokeToken",
        secretCer: "okgOZmQDDvDxxLNMHfdQZs7WP5lFuInI",
        userAgent:UserAgentEnum.android,
      );
    }
    Get.put(flavor, permanent: true);
    customAppFlavor = flavor;
    screenPages.addAll([
      DocumentRouting.config().page,
      DocumentDetailsRouting.config().page,
      CarsRouting.config().page,
      AddCarRouting.config().page,
      CarDetailsRouting.config().page,
      CarIstimaraRouting.config().page,
      CarIstimaraConfirmPhotoRouting.config().page,
      WalletRouting.config().page,
      WalletCashOutRouting.config().page,
      PaymentMethodRouting.config().page,
      EarningRouting.config().page,
      AnalyticsRouting.config().page,
      TripsRouting.config().page,
      PersonalInfoRouting.config().page,
      TermsOfServiceRouting.config().page,
      DriverDataRouting.config().page,
      AttachmentInfoRouting.config().page,
      ConfirmPhotoRouting.config().page,
    ]);

    mainCommon(
      flavor,
      screenPages,
    );
  }
}

void main() => Taxi24DriverMain();