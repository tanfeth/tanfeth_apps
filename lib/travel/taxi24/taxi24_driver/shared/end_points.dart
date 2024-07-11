
import 'package:tanfeth_apps/travel/common/shared/end_point/auth/auth_end_point.dart';
import 'package:tanfeth_apps/travel/common/shared/end_point/common_end_points.dart';



class Taxi24DriverEndPoints extends CommonEndpoints {

  Taxi24DriverEndPoints():super(
    authEndPoints: const AuthEndPoints(
      login: "/api/Auth/login",
      register: "/api/Auth/Register/Driver",
      sendCode: "User/sendCode",
      verify: '/api/Auth/Verify',
      getProfile: "/api/Driver/DriverProfileResponse"
    ),

    getCities: '/api/Auth/GetCities'
  );
}
