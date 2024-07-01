


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
import 'package:tanfeth_apps/travel/common/shared/routes/add_car_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/add_rider_instruction_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/add_rider_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/analytics_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/car_detalis_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/car_istimara_confirm_photo_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/car_istimara_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/cars_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/choose_ride_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/complete_trip_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/destination_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/driver_data_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/earning_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/payment_method_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/personal_info_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/promo_code_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/set_location_on_map_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/terms_service_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/trip_details_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/trips_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/wallet_cash_Out_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/wallet_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/end_points.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/taxi24_passenger_languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/taxi_passenger_enum.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_passenger/shared/theme/theme.dart';



class Taxi24PassengerMain {

  List<GetPage> screenPages = [];

  Taxi24PassengerMain() {
    MinusWebWidth = 400;
    bool isStaging = const String.fromEnvironment("staging").isNotEmpty;

    final String baseUrl = kReleaseMode || isStaging
        ? "https://test.taxi24.app/api"
        : "https://devapi.taxi24.app/api";

    var flavor = FlavorConfig(
        baseUrl: baseUrl,
        appNameEnum: AppNameEnum.taxi24Passenger,
        commonEnum: TaxiPassengerEnum(),
        myLanguages: Taxi24PassengerLanguages(),
        endPoints: Taxi24PassengerEndPoints(),
        appCategoryEnum: {AppCategoryEnum.travel},
        theme: Taxi24PassengerTheme(),
        shareUrl: 'https://test.taxi24.app/api',
         mapApiKey: 'AIzaSyArcxVdw-9ehlF1atcclWSLBqv3UBiKMeo'
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
      DestinationRouting.config().page,
      AddRiderInstructionRouting.config().page,
      AddRiderRouting.config().page,
      SetLocationOnMapRouting.config().page,
      ChooseRideRouting.config().page,
      TripDetailsRouting.config().page,
      PromoCodeRouting.config().page,
      CompleteTripRouting.config().page,

    ]);

    mainCommon(
      flavor,
      screenPages,
    );
  }
}

void main() => Taxi24PassengerMain();