
import 'package:tanfeth_apps/travel/common/shared/end_point/auth/auth_end_point.dart';
import 'package:tanfeth_apps/travel/common/shared/end_point/common_end_points.dart';



class Taxi24DriverEndPoints extends CommonEndpoints {

  Taxi24DriverEndPoints():super(
    authEndPoints: AuthEndPoints(
      login: "/Driver/login",
      register: "/User/Register",
      sendCode: "User/sendCode",
      getProfile: "/User/driver/profile"
    ),

  );


  final String sendCode="/User/sendCode";
  final String driverRegister="/User/Register";
  final String login="/Driver/login";
  final String deleteAccount="/User/delete";
  final String verifyAccount="/User/send-email";
  final String kGetProfile="/User/driver/profile";
  final String uploadDriverDocument="/Driver";
  final String uploadDriverProfile="/User/profile";
  final String checkDriverData="/Car/DriverCarStatus";
  final String addDriverCar="/Car";
  final String getDriverCar="/Car/user-cars";
  final String uploadCarDocument="/Car/registration-insurance";
  final String kUpdateProfile="/User/profile";
  final String kUpdateOrderStatus="/Order/UpdateOrderStatus";
  final String kRate="/Order/rate-trip";
  final String kDriverHasTrip="/Order/driver-intrip";
  final String setCarDefault="/Car/status";
  final String kSaveCardToWallet="/payment/save-card";
  final String kSaveCard="/payment/save-card";
  final String kWallet="/wallet/user";
  final String kTransactions="/wallet/Transactions";
  final String kTransfer="/wallet/ConfirmTransfer";
  final String kTransferToWallet="/wallet/Driver/TransferToWallet";
  final String kCard="/Card";
  final String kGetTrips="/Order/MyTrips";
  final String kGetTripDetails="/Order/driver";
  final String kSupport="/Support";
  final String kAccount="/Account";
  final String kNotification="/Notification";
  final String kEarnings="/Order/Earnings";
  final String kAnalytics="/Order/Analytics";
  final String kCashPay="/Order/cash-pay";
  final String kCompleteTrip="/Order/complete";
  final String kRemoveTripFromDriver="/Order/driver-remove-trip";
}
