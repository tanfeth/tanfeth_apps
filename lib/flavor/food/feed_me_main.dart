


import 'package:api_controller/api/api_controller.dart';
import 'package:api_controller/api/api_enum.dart';
import 'package:api_controller/shared/grid_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/cart_route.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/offers_route.dart';
import 'package:tanfeth_apps/flavor/common_main.dart';
import 'package:tanfeth_apps/flavor/flavor_config.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/food/feed_me/shared/end_points.dart';
import 'package:tanfeth_apps/food/feed_me/shared/feed_me_enum.dart';
import 'package:tanfeth_apps/food/feed_me/shared/feed_me_languages.dart';
import 'package:tanfeth_apps/food/feed_me/shared/theme/theme.dart';



class FeedMeMain {

  List<GetPage> screenPages = [];

  FeedMeMain() {
    minusWebWidth = 400;
    bool isStaging = const String.fromEnvironment("staging").isNotEmpty;

    final String baseUrl = kReleaseMode || isStaging
        ? "https://test.taxi24.app"
        : "https://devapi.taxi24.app";

    var flavor = FlavorConfig(
        baseUrl: baseUrl,
        appNameEnum: AppNameEnum.feedMe,
        appEnum: 3,
        commonEnum: FeedMeEnum(),
        myLanguages: FeedMeLanguages(),
        endPoints: FeedMeEndPoints(),
        appCategoryEnum: {AppCategoryEnum.food},
        theme: FeedMeTheme(),
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
      OffersRouting.config().page,
      CartRouting.config().page,
    ]);

    mainCommon(
      flavor,
      screenPages,
    );
  }
}

void main() => FeedMeMain();