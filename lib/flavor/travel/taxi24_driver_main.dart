


import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/network/network/api/api_controller.dart';
import 'package:tanfeth_apps/common/network/network/enums/api_enum.dart';
import 'package:tanfeth_apps/common/shared/grid_helper.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/document_details_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/document_route.dart';
import 'package:tanfeth_apps/flavor/common_main.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/cars_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/end_points.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/taxi24_driver_enum.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/taxi24_driver_languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/shared/theme/theme.dart';



class taxi24DriverMain {

  List<GetPage> screenPages = [];

  taxi24DriverMain() {
    MinusWebWidth = 400;
    bool isStaging = const String.fromEnvironment("staging").isNotEmpty;

    final String baseUrl = kReleaseMode || isStaging
        ? "https://test.taxi24.app/api"
        : "https://devapi.taxi24.app/api";

    var flavor = FlavorConfig(
        baseUrl: baseUrl,
        appNameEnum: AppNameEnum.taxi24Driver,
        commonEnum: Taxi24DriverEnum(),
        myLanguages: Taxi24DriverLanguages(),
        endPoints: Taxi24DriverEndPoints(),
        appCategoryEnum: {AppCategoryEnum.travel},
        theme: Taxi24DriverTheme(),
        shareUrl: 'https://test.taxi24.app/api',
    );
    if (!(kReleaseMode || isStaging))
      Auth.init(
        apiKey: "a2b63710-5b7d-4b58-8fc8-4a12724dfecc",
        appSecret: "d1e28279-ef34-4cf8-9c17-04fd1ff9a4e9",
        refreshTokenUrl: "/v1/Authentication/RefreshToken",
        revokeTokenUrl: "/v1/Authentication/RevokeToken",
        secretCer: "okgOZmQDDvDxxLNMHfdQZs7WP5lFuInI",
        userAgent:UserAgentEnum.android,
      );
    else
      Auth.init(
        apiKey: "a2b63710-5b7d-4b58-8fc8-4a12724dfecc",
        appSecret: "d1e28279-ef34-4cf8-9c17-04fd1ff9a4e9",
        refreshTokenUrl: "/v1/Authentication/RefreshToken",
        revokeTokenUrl: "/v1/Authentication/RevokeToken",
        secretCer: "okgOZmQDDvDxxLNMHfdQZs7WP5lFuInI",
        userAgent:UserAgentEnum.android,
      );
    Get.put(flavor, permanent: true);
    customAppFlavor = flavor;
    screenPages.addAll([
      DocumentRouting.config().page,
      DocumentDetailsRouting.config().page,
      CarsRouting.config().page,
    ]);

    mainCommon(
      flavor,
      screenPages,
    );
  }
}

void main() => taxi24DriverMain();