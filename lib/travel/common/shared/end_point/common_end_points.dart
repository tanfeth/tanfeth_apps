

import 'package:tanfeth_apps/travel/common/shared/end_point/auth/auth_end_point.dart';

class CommonEndpoints{
  AuthEndPoints authEndPoints;
  final String getCities;

  final String driverRegister;
  final String deleteAccount;
  final String verifyAccount;
  final String kGetProfile;
  final String uploadDriverDocument;
  final String uploadDriverProfile;
  final String checkDriverData;
  final String addDriverCar;
  final String getDriverCar;
  final String uploadCarDocument;
  final String kUpdateProfile;
  final String kUpdateOrderStatus;
  final String kRate;
  final String kDriverHasTrip;
  final String setCarDefault;
  final String kSaveCardToWallet;
  final String kSaveCard;
  final String kWallet;
  final String kTransactions;
  final String kTransfer;
  final String kTransferToWallet;
  final String kCard;
  final String kGetTrips;
  final String kGetTripDetails;
  final String kSupport;
  final String kAccount;
  final String kNotification;
  final String kEarnings;
  final String kAnalytics;
  final String kCashPay;
  final String kCompleteTrip;
  final String kRemoveTripFromDriver;

  CommonEndpoints({
    this.authEndPoints = const AuthEndPoints(),
    this.getCities = '',
    this.addDriverCar ='',
    this.deleteAccount = '',
    this.checkDriverData ='',
    this.driverRegister='',
    this.getDriverCar ='',
    this.kAccount='',
    this.kAnalytics='',
    this.kCard='',
    this.kCashPay ='',
    this.kCompleteTrip ='',
    this.kDriverHasTrip ='',
    this.kEarnings ='',
    this.kGetProfile ='',
    this.kGetTripDetails ='',
    this.kGetTrips ='',
    this.kNotification ='',
    this.kRate ='',
    this.kRemoveTripFromDriver ='',
    this.kSaveCard ='',
    this.kSaveCardToWallet ='',
    this.kSupport ='',
    this.kTransactions='',
    this.kTransfer='',
    this.kTransferToWallet='',
    this.kUpdateOrderStatus='',
    this.kUpdateProfile='',
    this.kWallet='',
    this.setCarDefault='',
    this.uploadCarDocument='',
    this.uploadDriverDocument='',
    this.uploadDriverProfile='',
    this.verifyAccount='',

  });

}