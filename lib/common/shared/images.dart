import 'package:flutter/services.dart' as services;
import 'package:tanfeth_apps/common/shared/custom_methods.dart';

class Images {
  static String  appLogo = '';
  static String  locationLottie = '';
  static String  driverImage = '';
  static String  pickUpImg = '';
  static String  destinationImage = '';
  static String  mapCarImage = '';
  static String  navigationImage = '';
  static String  swipeIcon = '';
  static String  personWithSuccessImage = '';
  static String  saudiArabiaIconSVG = '';
  static String  appLogoSVG = '';
  static String  welcomeGroup10SVG = '';
  static String  welcomeGroup14SVG = '';
  static String  homeSVG = '';
  static String  personSVG = '';
  static String  walletSVG = '';
  static String  locationDetectorSVG = '';
  static String  userLocation = '';
  static String  formFieldCircleSVG = '';
  static String  heartSVG = '';
  static String  heartFilledSVG = '';
  static String  fullClockSVG = '';
  static String  locationPinSVG = '';
  static String  avatar = '';
  static String  downArrow = '';
  static String  pickUp = '';
  static String  avatarSVG = '';
  static String  downArrowSVG = '';
  static String  pickUpSVG = '';
  static String  percentageSVG = '';
  static String  carSVG = '';
  static String  cardSVG = '';
  static String  cashSVG = '';
  static String  locationSVG = '';
  static String  questionMarkSVG = '';
  static String  securityCodeCardSVG = '';
  static String  visaSVG = '';
  static String  arrowSVG = '';
  static String  arrowLeftSVG = '';
  static String  starSVG = '';
  static String  redStarSVG = '';
  static String  orangeStarSVG = '';
  static String  passengerSVG = '';
  static String  expiryDateCardSVG = '';
  static String  addRiderSVG = '';
  static String  addressBookSVG = '';
  static String  recentClock = '';
  static String  alertSVG = '';
  static String  becomeCaptainSVG = '';
  static String  editPenSVG = '';
  static String  helpSVG = '';
  static String  languageSVG = '';
  static String  personAvatarSVG = '';
  static String  privacySVG = '';
  static String  kStarSVG = '';
  static String  userWithMapSVG = '';
  static String  userWithRestSVG = '';
  static String  personInfoSVG = '';
  static String  rateAppSVG = '';
  static String  cardsSVG = '';
  static String  transactionsSVG = '';
  static String  tripCarSVG = '';
  static String  plusSVG = '';
  static String  plusIconSVG = '';
  static String  userWithMessageSVG = '';
  static String  mastercardSVG = '';
  static String  successSVG = '';
  static String  rejectSVG = '';
  static String  dotsSVG = '';
  static String  starIconSVG = '';
  static String  editIconSVG = '';
  static String  deleteIconSVG = '';
  static String  sendSVG = '';
  static String  englishSVG = '';
  static String  arabicSVG = '';
  static String  calendarSVG = '';
  static String  fileSVG = '';
  static String  driverCarSVG = '';
  static String  routeToSVG = '';
  static String  logOutSVG = '';
  static String  checkMarkSVG = '';
  static String  cameraSVG = '';
  static String  gallerySVG = '';
  static String  alertIconSVG = '';
  static String  walletProfileSVG = '';
  static String  earningsProfileSVG = '';
  static String  carProfileSVG = '';
  static String  documentProfileSVG = '';
  static String  settingProfileSVG = '';
  static String  aboutProfileSVG = '';
  static String  accsMarkSVG = '';
  static String  moreSVG = '';
  static String  closeSVG = '';
  static String  listSVG = '';
  static String  phoneSVG = '';
  static String  navigationArrowSVG = '';
  static String  bankSVG = '';
  static String  sendSettingsSVG = '';
  static String  bankCardSVG = '';
  static String  activitySVG = '';
  static String  checkMarkCircleSVG = '';
  static String  searchSVG = '';
  static String  errorSVG = '';
  static String  navigationOutlineSVG = '';
  static String onboard1 = "";
  static String onboard2 = "";
  static String onboard3 = "";
  static String close = "";
  static String startGif = "";
  static String shareGif = "";
  static String notification = "";
  static String sun = "";
  static String car = "";
  static String pickOnMapSVG = "";
  static String tap = "";
  static String scroll = "";
  static String pickUpImage = "";
  static String destinationMarker = "";
  static String emptyTrip = "";

  static String bank = "";
  static String cash = "";
  static String visa = "";
  static String sedan = "";
  static String familyCar = "";
  static String user = "";
  static String pending = "";
  static String slide = "";
  static String slide1 = "";
  static String slide2 = "";
  static String slide3 = "";
  static String sutis =  "";
  static String  cheese =  "";
  static String italy =  "";
  static String drinks =  "";
  static String pizza =  "";
  static String burger = "";
  static String sandwich =  "";
  static String bety =  "";
  static String shawarma =  "";
  static String asia =  "";
  static String resturant =  "";
  static String offer =  "";


  static String fav =  "";
  static String share = "";
  static String support =  "";
  static String complain =  "";
  static String rate =  "";
  static String condition =  "";
  static String whatsApp =  "";
  static String nightMode =  "";




  static Future<void> initImages() async {
     appLogo = await checkImage('logo.png');
     locationLottie = await checkImage('location.json');
     driverImage = await checkImage('driver.png');
     pickUpImg = await checkImage('Pickupimg.png');
     destinationImage = await checkImage('destination.png');
     mapCarImage = await checkImage( 'map_car.png');
     navigationImage = await checkImage( 'navigation-arrow-icon.png');
     swipeIcon = await checkImage( 'swipe_icon.gif');
     personWithSuccessImage = await checkImage( 'person_with_success.png');
     saudiArabiaIconSVG = await checkImage( 'saudi-arabia.svg');
     appLogoSVG = await checkImage( 'logo.svg');
     welcomeGroup10SVG = await checkImage( 'welcome_group10.svg');
     welcomeGroup14SVG = await checkImage( 'welcome_group14.svg');
     homeSVG = await checkImage( 'home.svg');
     personSVG = await checkImage( 'person.svg');
     walletSVG = await checkImage( 'wallet.svg');
     locationDetectorSVG = await checkImage( 'location_detector.svg');
     userLocation = await checkImage( 'User_location.png');
     formFieldCircleSVG = await checkImage('form_field_circle.svg');
     heartSVG = await checkImage( 'heart.svg');
     heartFilledSVG = await checkImage( 'heart-filled-icon.svg');
     fullClockSVG = await checkImage( 'full_clock.svg');
     locationPinSVG = await checkImage( 'location_pin.svg');
     avatar = await checkImage( 'Avatar.svg');
     downArrow = await checkImage( 'chevron-down-icon.svg');
     pickUp = await checkImage( 'Pickup.svg');
     avatarSVG = await checkImage( 'Avatar.svg');
     downArrowSVG = await checkImage( 'chevron-down-icon.svg');
     pickUpSVG = await checkImage( 'Pickup.svg');
     percentageSVG = await checkImage( 'percentage.svg');
     carSVG = await checkImage( 'car.svg');
     cardSVG = await checkImage( 'card.svg');
     cashSVG = await checkImage( 'cash.svg');
     locationSVG = await checkImage( 'location.svg');
     questionMarkSVG = await checkImage( 'question_mark.svg');
     securityCodeCardSVG = await checkImage( 'security_code_card.svg');
     visaSVG = await checkImage( 'visa.svg');
     arrowSVG = await checkImage( 'chevron-right-icon.svg');
     arrowLeftSVG = await checkImage( 'chevron-left-icon.svg');
     starSVG = await checkImage( 'star.svg');
     redStarSVG = await checkImage( 'red_star.svg');
     orangeStarSVG = await checkImage( 'orange_star.svg');
     passengerSVG = await checkImage( 'passenger.svg');
     expiryDateCardSVG = await checkImage( 'expiry_date_card.svg');
     addRiderSVG = await checkImage( 'Add-a-rider.svg');
     addressBookSVG = await checkImage( 'address-book-icon.svg');
     recentClock = await checkImage( 'recent-clock.svg');
     alertSVG = await checkImage( 'alert.svg');
     becomeCaptainSVG = await checkImage( 'become_captain.svg');
     editPenSVG = await checkImage( 'edit_pen.svg');
     helpSVG = await checkImage( 'help.svg');
     languageSVG = await checkImage( 'language.svg');
     personAvatarSVG = await checkImage( 'person_avatar.svg');
     privacySVG = await checkImage( 'privacy.svg');
     kStarSVG = await checkImage( 'star.svg');
     userWithMapSVG = await checkImage( 'user_with_map.svg');
     userWithRestSVG = await checkImage( 'user_with_rest.svg');
     personInfoSVG = await checkImage( 'person_info.svg');
     rateAppSVG = await checkImage( 'rate_app.svg');
     cardsSVG = await checkImage( 'Cards.svg');
     transactionsSVG = await checkImage( 'Transactions.svg');
     tripCarSVG = await checkImage( 'trip_car.svg');
     plusSVG = await checkImage( 'plus.svg');
     plusIconSVG = await checkImage( 'plus_icon.svg');
     userWithMessageSVG = await checkImage( 'user_with_message.svg');
     mastercardSVG = await checkImage( 'Mastercard.svg');
     successSVG = await checkImage( 'Success.svg');
     rejectSVG = await checkImage( 'reject.svg');
     dotsSVG = await checkImage( 'dots-icon.svg');
     starIconSVG = await checkImage( 'star-icon.svg');
     editIconSVG = await checkImage( 'edit-icon.svg');
     deleteIconSVG = await checkImage( 'delete-icon.svg');
     sendSVG = await checkImage( 'send.svg');
     englishSVG = await checkImage( 'english.svg');
     arabicSVG = await checkImage( 'saudi-arabia.svg');
     calendarSVG = await checkImage( 'calendar.svg');
     fileSVG = await checkImage( 'file.svg');
     driverCarSVG = await checkImage( 'driver_car.svg');
     routeToSVG = await checkImage( 'route_to.svg');
     logOutSVG = await checkImage( 'log_out.svg');
     checkMarkSVG = await checkImage( 'check_mark.svg');
     cameraSVG = await checkImage( 'camera.svg');
     gallerySVG = await checkImage( 'gallery.svg');
     alertIconSVG = await checkImage( 'alert-icon.svg');
     walletProfileSVG = await checkImage( 'wallet_profile.svg');
     earningsProfileSVG = await checkImage( 'earnings_profile.svg');
     carProfileSVG = await checkImage( 'car_profile.svg');
     documentProfileSVG = await checkImage( 'document_profile.svg');
     settingProfileSVG = await checkImage( 'setting_profile.svg');
     aboutProfileSVG = await checkImage( 'about_profile.svg');
     accsMarkSVG = await checkImage( 'accs_mark.svg');
     moreSVG = await checkImage( 'more.svg');
     closeSVG = await checkImage( 'close-icon.svg');
     listSVG = await checkImage( 'list-icon.svg');
     phoneSVG = await checkImage( 'phone-icon.svg');
     navigationArrowSVG = await checkImage( 'navigation-arrow-icon.svg');
     bankSVG = await checkImage( 'bank-icon.svg');
     sendSettingsSVG = await checkImage( 'send_settings.svg');
     bankCardSVG = await checkImage( 'Bank.svg');
     activitySVG = await checkImage( 'activity-icon.svg');
     checkMarkCircleSVG = await checkImage( 'checkmark-circle-icon.svg');
     searchSVG = await checkImage( 'search-icon.svg');
     errorSVG = await checkImage( 'error-icon.svg');
     navigationOutlineSVG = await checkImage( 'navigation_outline.svg');
     onboard1 = await checkImage('onboard1.png');
     onboard2 = await checkImage('onboard2.png');
     onboard3 = await checkImage('onboard3.png');
     close = await checkImage('close.svg');
     startGif = await checkImage('star.gif');
     shareGif = await checkImage('share.gif');
     notification = await checkImage('notification.png');
     sun = await checkImage('sun.svg');
     car = await checkImage('car.png');
     pickOnMapSVG  =await checkImage('pick_map.svg');
     tap = await checkImage('tap.png');
     scroll = await checkImage('scroll.png');
     pickUpImage = await checkImage('pickUp.png');
     destinationMarker = await checkImage('destination_marker.png');
     emptyTrip = await checkImage('empty_trip.svg');
     bank = await checkImage("bank.png");
     cash = await checkImage("cash.png");
     visa = await checkImage("visa.png");
     familyCar = await checkImage("family_car.png");
     sedan = await checkImage("sedan.png");
     user = await checkImage("user_icon.png");
     pending = await checkImage("pending.png");
     slide1 = await checkImage('slide1.png');
     slide2 = await checkImage('slide2.png');
     slide3 = await checkImage('slide3.png');
     slide = await checkImage('slide.png');
     sutis = await checkImage('sutis.png');
     cheese = await checkImage('chees.png');
     italy = await checkImage('itlya.png');
     drinks = await checkImage('drinks.png');
     pizza = await checkImage('pizza.png');
     burger = await checkImage('burger.png');
     sandwich = await checkImage('sandwitsh.png');
     bety = await checkImage('bety.png');
     shawarma = await checkImage('shawrma.png');
     asia = await checkImage('asia.png');
     resturant = await checkImage('resturant.png');
     offer = await checkImage('offer.png');

     fav = await checkImage('fav.png');
     support = await checkImage('support.png');
     share = await checkImage('share.png');
     complain = await checkImage('complain.png');
     rate = await checkImage('rate.png');
     condition = await checkImage('condition.png');
     whatsApp = await checkImage('whats_app.png');
     nightMode= await checkImage('night_mode.png');

  }



  static Future<String> checkImage(String path) async {
    var finalPath = "";
    try {
      if (isTaxi24Driver) {
        finalPath = "assets/taxi24Driver/$path";
      }else if(isTaxi24Passenger){
        finalPath = "assets/taxi24Passenger/$path";
      }else if(isFeedMe){
        finalPath = "assets/feedMe/$path";
      }
      await services.rootBundle.loadString(finalPath);
      return finalPath;
    } on FormatException {
      return finalPath;
    } catch (_) {
      return "assets/common/images/$path";
    }
  }
}
