import 'package:get/get.dart';

extension LangEx on LangEnum {
  String tr() {
    return name.tr;
  }
}

enum LangEnum {
  appSlogan,
  loadingPleaseWait,
  noInternetConnection,
  yesInternetConnection,
  hintInternetConnection,
  validatePhoneEmpty,
  validatePhoneStartValidator,
  validatePhoneValidator,
  validatePassEmpty,
  validatePassRegExp,
  validatePassRegExpLettersAndDigits,
  validatePasswordLength,
  validatePasswordNotMatch,
  validateFieldRequired,
  validateNameLength,
  validateEmail,
  validateNote,
  myFatoorah,
  noInternet,
  makeSureConnected,
  confirm,
  cancel,
  termsOfUse,
  login,
  mustLogin,
  optional,
  options,
  arabic,
  english,
  skip,
  startNow,
  doNotHaveAccount,
  registerNow,
  password,
  forgetPassword,
  changePassword,
  currentPassword,
  newPassword,
  confirmNewPassword,
  email,
  saveChanges,
  loginBtn,
  deliveryLogin,
  skipLogin,
  forgetPassDesc,
  mobile,
  send,
  verifyMobileNumber,
  verifyDesc,
  resendCode,
  resetPassword,
  reset,
  createNewAccount,
  registerBtn,
  gender,
  city,
  zone,
  neighborhood,
  street,
  buildingNumber,
  floorNumber,
  delegateNotes,
  confirmPassword,
  chooseFromList,
  createAccount,
  iHaveReadAndAgreeTo,
  termsAndConditions,
  registerSuccessTitle,
  home,
  cart,
  more,
  address,
  change,
  addresses,
  contactMobile,
  chooseLocationOnMap,
  chooseLocationOnMapBtn,
  setAsDefaultAddress,
  save,
  addNewAddress,
  yes,
  no,
  appName,
  viewAll,
  copyRight,
  myAccount,
  editProfile,
  myOrders,
  notifications,
  noResults,
  noBranches,
  settings,
  language,
  help,
  aboutAppName,
  faq,
  faqNoResults,
  privacyPolicy,
  contactUs,
  shareApp,
  rateApp,
  discount,
  riyal,
  addToCart,
  haveAnAccount,
  loginNow,
  categories,
  welcome,
  value,
  paymentMethod,
  completeOrder,
  orderCost,
  valueAddedTax,
  totalDue,
  mobileHint,
  contactInformation,
  followUsOnSocialS,
  contactFormTitle,
  contactFormNewTitle,
  contactFormSecondTitle,
  message,
  name,
  orderDetails,
  searchResultsFor,
  searchForLocation,
  searchHint,
  pressAgainToExit,
  signOut,
  deleteAccount,
  delete,
  totalProducts,
  orderNumber,
  orderStatus,
  orderDateTime,
  downloading,
  failed,
  priceWithTax,
  notes,
  orderTotal,
  locationOnMap,
  finishOrder,
  shoppingCart,
  takePhoto,
  uploadFromGallery,
  dotYouWantToDeleteAccount,
  dotYouWantToSignOut,
  failedToPay,
  paymentCompletedSuccessfully,
  male,
  female,
  minute,
  saudi,
  attachFile,
  attached,
  file,
  paymentStatus,
  mustContain,
  digits,
  validateNameLengthNoNumber,
  onboardDes1,
  onboardTitle1,
  onboardDes2,
  onboardTitle2,
  onboardDes3,
  onboardTitle3,
  favourite,
  confirmLocation,
  appVersion,
  managerLogin,
  completeYourMeal,
  pleaseWait,
  orderNumberIs,
  followOrder,
  loginNowAndEnjoy,
  messageType,
  messageAddress,
  receivingMethod,
  receiving,
  fromBranch,
  exploreMenu,
  chooseBranch,
  acceptedOrderDes,
  orderInformation,
  clientName,
  deliveryCharge,
  discountValue,
  deliveryAddress,
  expectedTime,
  rateOrder,
  foodQuality,
  howToApply,
  qualityOfService,
  commentsSuggestions,
  orderItems,
  clientNotes,
  completePayment,
  changeOrderStatus,
  orderAgain,
  distinguishedCustomerDes,
  notSatisfied,
  acceptable,
  good,
  excellent,
  commentsHint,
  itemComponents,
  mealType,
  required,
  addIngredient,
  hot,
  cold,
  processingTimeDes,
  inShop,
  inHome,
  ifAvailable,
  confirmOrderAndPay,
  orderMore,
  outOfBusiness,
  calories,
  calorie,
  allergens,
  unableToServe,
  until,
  orderNow,
  maintenanceStatus,
  peakTime,
  administration,
  reports,
  workTime,
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  todayStatistics,
  totalBranchRequests,
  newOrders,
  deliveryRequests,
  sefaryOrder,
  talabatLocal,
  requestsProgress,
  completedOrder,
  cancelOrder,
  notificationAlertDes,
  done,
  showOrderDetails,
  printInvoice,
  deliverAlert,
  loginAsGuest,
  newRegister,
  accountType,
  commercialRegistrationNo,
  commercialRegistrationImg,
  favorites,
  paymentHistory,
  returnPolicy,
  addressName,
  recipientName,
  addressDescription,
  downloadInvoice,
  deliveryDetails,
  geolocation,
  showOnMap,
  paymentDetails,
  amountPaid,
  paymentDateTime,
  taxInvoice,
  download,
  products,
  cashOnDeliveryFees,
  rateCommentHint,
  rateOrderDescription,
  reportProblem,
  anotherReasonDesc,
  reasonForCancellation,
  causeOfProblem,
  latestOffers,
  showMore,
  mostWanted,
  customerReviews,
  search,
  sortBy,
  newestToOldest,
  oldestToNewest,
  productCode,
  processingTime,
  averageSize,
  gram,
  hours,
  added,
  toCartSuccessfully,
  continueShopping,
  viewCart,
  total,
  addMore,
  deliveryMethod,
  receiptFromBranch,
  homeDelivery,
  changeAddress,
  suitableDateForDelivery,
  clickToSelectTheDate,
  perfectTimeForDelivery,
  paymentCompletedSuccessfullyDesc,
  notificationAlert,
  noNotifications,
  allCategory,
  category,
  offers,
  permissionLocationTitle,
  thereAreNoAddresses,
  pendingForAcceptOrder,
  pendingForCustomerPay,
  paid,
  receivedAndPreparing,
  prepared,
  pending,
  delivered,
  received,
  canceled,
  noInvoice,
  notAvailableNow,
  notAvailableThisTime,
  loginRegistration,
  searchingSpecificProduct,
  enterNameSearchBox,
  noSearchResults,
  letSuggestOtherVarietiesForYou,
  emptyCart,
  emptyCartSuggest,
  addedToCart,
  visa,
  paymentWhenReceiving,
  wantChangeReceiptMethod,
  wantChangeBranch,
  allItemsWillBeDeleted,
  thereAreRequiredOptions,
  requiredText,
  individual,
  facility,
  chefTips,
  couponDiscount,
  couponHint,
  verification,
  choseForYou,
  orderedBefore,
  dealOfTheDay,
  wholesaleOrdersSector,
  appDes,
  wholesaleOrderForm,
  companyName,
  institutionActivity,
  mustSelectRate,
  branchDetails,
  similar,
  sucessToastMessage,
  toastRateMessage,
  toastAddFavMessage,
  toastRemoveFavMessage,
  contactUsSuccessMsg,
  noBranchesInThisArea,
  noBranchesInThisAreaDesc,
  chooseAnotherAddress,
  theOrderNumber,
  notAvailable,
  notAvailableThisHour,
  notAvailableInBranch,
  showMobile,
  accept,
  reject,
  sortedBy,
  sortAsc,
  sortDesc,
  apply,
  from,
  to,
  selectPrimaryAddress,
  morning,
  evening,
  thereIsNoTimeAvailable,
  paidDate,
  all,
  lowestPrice,
  highestPrice,
  durationExpected,
  deliveryDate,
  noServicesCurrently,
  changeLocation,
  pleaseChangeAddress,
  discountPercentage,
  discountCouponValue,
  costValueAfterDiscount,
  cashDeliveryFees,
  district,
  ageOfSacrifice,
  others,
  immediateDelivery,
  deliveryPeriod,
  noResultsPleaseAddAddress,
  deservedAmount,
  amount,
  mustWriteAddress,
  fromDate,
  toDate,
  latestOrders,
  searchResults,
  orderValue,
  invaildInvoiceUrl,
  morningAppointments,
  eveningAppointments,
  ok,
  areYouSure,
  edit,
  image,
  uploadError,
  fileTypeError,
  document,
  audio,
  video,
  somethingWrong,
  connectionError,
  info,
  add,
  yourName,
  start,
  welcomeTitle,
  welcomeDes,
  enterMobileNumDes,
  enterMobileNum,
  numPhone,
  continueWord,
  enterCode,
  codeDesReset,
  sure,
  codeDesRegister,
  resendCodeDesc,
  resendCodeBtn,
  enable,
  navigate,
  profile,
  completedTrips,
  lowCompletionRate,
  today,
  close,
  compilationRate,
  acceptanceRate,
  about,
  logout,
  myCars,
  wallet,
  earnings,
  personalInfo,
  copyright,
  verifyValidate,
  paymentAndPricing,
  sendMessage,
  other,
  itemProblem,
  walletProblem,
  captainProblem,
  upload3Pic,
  enterATextAtLeast,
  describeProblem,
  saudiID,
  drivingLicense,
  resubmit,
  completed,
  addCar,
  active,
  removeCar,
  sureRemove,
  willNotAbleCar,
  setActive,
  viewDocuments,
  addNewCar,
  carDetails,
  vehicleRegistration,
  vehicleInsurance,
  carType,
  searchCarType,
  selectCarType,
  carModel,
  selectCarTypeValidator,
  modelYear,
  selectCarYearModel,
  selectCarModelValidator,
  uploadFrontAndBackCar,
  carPhotos,
  color,
  sequenceNumber,
  letterRight,
  letterLeft,
  middleLetter,
  plateNumber,
  carClassification,
  selectCarClassification,
  uploadPhoto,
  chooseFromGaller,
  photoTakenGoodLight,
  photoBlurry,
  registerVehicle,
  acceptDocumentType,
  makeSureTo,
  confirmPhoto,
  useDateWarn,
  makeSurePhotoDetails,
  addExpiryDate,
  reTakePhoto,
  uploadVehicleInsurance,
  sar,
  availableBalance,
  payTaxi,
  cashOut,
  choosePaymentMethod,
  minimumBalanceRequestCash,
  addCreditDebitCard,
  defaultWord,
  setDefault,
  bankAccount,
  addBankAccount,
  usedReceiveMoney,
  myTrips,
  analytics,
  trips,
  inWord,
  timeRange,
  workHours,
  breakDown,
  netEarnings,
  tip,
  cancelFees,
  totalEarnings,
  daily,
  weekly,
  monthly,
  finishedTrips,
  youDidntAccept,
  youCanceled,
  passengerCanceled,
  passengerDidntShow,
  chagePic,
  birthDate,
  areSureWantDeleteAccount,
  yourLoseAllData,
  enterDetails,
  fullname,
  birthdateHijri,
  hijriDate,
  visitor,
  iAgree,
  completeStepsFinishEnrollment,
  personalPhoto,
  drivingLicence,
  howStartDriver,
  vehicleRequirements,
  darkMode,
  lightMode,
  chooseFromGallery,
  menu,
  menuOption,
  walletOption,
  startOption,
  rateOption,
  compilationRateOption,
  acceptanceRateOption,
  carsOption,
  priceOption,
  shareOption,
  rateAppOption,
  noData,
  hello,
  whereTo,
  selectDestination,
  changeRide,
  currentLocation,
  whereToGo,
  setOnMap,
  scrollHere,
  previousTrips,
  changeRider,
  addNewRider,
  requestRideForSomeone,
  addRider,
  ridersMustLeast18Years,
  theyReceiveTripInfoTextMmessage,
  payTripCreditOrPayDriverCash,
  trackTripFromApp,
  nameAppearToDriver,
  getNumberContacts,
  selectAvalidMobileNumber,
  selectLocation,
  chooseRide,
  confirmPickLocation,
  confirmCurrentLocation,
  cash,
  addPromo,
  promoCode,
  activate,
  completeTrip,
  bankTransfer,
  onlinePayment,
  confirmPickUpLocation,
  becomeCaptain,
  tripDetails,
  tripCost,
  waitTme,
  balance,
  reportTrip,
  sedan,
  familyCar,
  route,
  findADriver,
  transactions,
  currentBalance,
  myCards,
  noPlace,
  addAddressToFavourite,
  addPlace,
  addCards,
  noCard,
  addCardList,
  searching,
  areSureWantCancel,
  cancelRide,
  whyWantCancel,
  noKeepRide,
  chargedCancelling,
  call,
  carCaseHint,
  pickLocationCaseHint,
  destinationCaseHint,
  payWayCaseHint,
  paymentPriceCaseHint,
  callDriverHint,
  currentLocationHint,
  cancelRideCaseHint,
  personInfoHint,
  myTripHint,
  favouritePlaceHint,
  whereToGoHint,
  previousTripsHint,
  reorderListHint,
  tripHint,
  noTransaction,
  transactionHint, goOffline, decline, km, payYourExpenses,
}

class MyLanguages extends Translations {
  final Map<String, String> arStrings = {};
  final Map<String, String> enStrings = {};

  static const arKey = 'ar';
  static const enKey = 'en';

  @override
  Map<String, Map<String, String>> get keys {
    addString(
        key: LangEnum.noInternetConnection.toString(),
        arValue: 'لا يوجد اتصال بالانترنت...',
        enValue: 'No internet connection...');

    addString(
        key: LangEnum.yesInternetConnection.toString(),
        arValue: 'تم الاتصال بالانترنت...',
        enValue: 'Internet connection successful...');

    addString(
        key: LangEnum.hintInternetConnection.toString(),
        arValue: 'حالة الاتصال',
        enValue: 'Connection State');

    addString(
        key: LangEnum.received.name,
        enValue: "Received",
        arValue: 'تم الاستلام');
    addString(
        key: LangEnum.orderValue.name,
        enValue: "Order Value",
        arValue: 'قيمة الطلب');
    addString(
        key: LangEnum.searchResults.name,
        enValue: "Search Results",
        arValue: 'نتائج البحث');
    addString(
        key: LangEnum.latestOrders.name,
        enValue: "Latest orders in addition",
        arValue: 'آخر الطلبات بالإضافة');
    addString(
        key: LangEnum.toDate.name, enValue: "To Date", arValue: 'إلي تاريخ');
    addString(
        key: LangEnum.fromDate.name, enValue: "From Date", arValue: 'من تاريخ');
    addString(
      key: LangEnum.mustWriteAddress.name,
      enValue: "You must write your address in detail",
      arValue: 'لا توجد نتائج برجاء إضافه عنوان',
    );
    addString(
      key: LangEnum.noResultsPleaseAddAddress.name,
      enValue: "There are no results, please add a title",
      arValue: 'لا توجد نتائج برجاء إضافه عنوان',
    );
    addString(
      key: LangEnum.notAvailableThisHour.name,
      enValue: "Not Available In This Hour",
      arValue: 'الصنف غير متاح فى هذه الساعة',
    );
    addString(
        key: LangEnum.deliveryPeriod.name,
        enValue: "Delivery Period",
        arValue: 'فتره التوصيل');
    addString(
        key: LangEnum.immediateDelivery.name,
        enValue: "Immediate delivery",
        arValue: 'التوصيل الفوري');
    addString(
        key: LangEnum.others.name,
        enValue: "other value",
        arValue: 'قيمة اخري');
    addString(
      key: LangEnum.ageOfSacrifice.name,
      enValue: "Age of the sacrifice",
      arValue: ' سن الذبيحه',
    );
    addString(
      key: LangEnum.pleaseChangeAddress.name,
      enValue: "Please Change Location",
      arValue: 'من فضلك غير الموقع',
    );
    addString(
      key: LangEnum.changeLocation.name,
      enValue: "Change Location",
      arValue: 'تغيير الموقع',
    );
    addString(
      key: LangEnum.noServicesCurrently.name,
      enValue:
          "We apologize, the service is currently not available at the specified address",
      arValue: 'نعتذر , لا تتوفر الخدمة حاليا في العنوان المحدد',
    );
    addString(
      key: LangEnum.deliveryDate.name,
      enValue: "Delivery date",
      arValue: 'تاريخ التوصيل',
    );
    addString(
      key: LangEnum.durationExpected.name,
      enValue: "Expected time to receive the order",
      arValue: 'المده المتوقعه لاستلام الطلب',
    );
    addString(
        key: LangEnum.lowestPrice.name,
        enValue: "Lowest price",
        arValue: 'الاقل سعر');
    addString(
        key: LangEnum.highestPrice.name,
        enValue: "highest price",
        arValue: 'الاعلي سعرا');
    addString(
      key: LangEnum.thereIsNoTimeAvailable.name,
      enValue:
          "Sorry, there is no time available on this day. Please choose another day",
      arValue: 'عذرا لا يوجد وقت متاح في هذا اليوم من فضلك اختر يوم اخر',
    );
    addString(key: LangEnum.all.name, enValue: "all", arValue: 'الكل');
    addString(
        key: LangEnum.paidDate.name,
        enValue: "Paid Date",
        arValue: 'تاريخ الدفع');
    addString(key: LangEnum.to.name, enValue: "to", arValue: 'الي');
    addString(key: LangEnum.from.name, enValue: "from", arValue: 'من');
    addString(
      key: LangEnum.selectPrimaryAddress.name,
      enValue: "Please choose a default address",
      arValue: 'من فضلك اختر عنوان افتراضي',
    );
    addString(key: LangEnum.evening.name, enValue: "evening", arValue: 'مسائي');
    addString(key: LangEnum.morning.name, enValue: "morning", arValue: 'صباحي');
    addString(key: LangEnum.accept.name, enValue: "Accept", arValue: 'قبول');
    addString(key: LangEnum.reject.name, enValue: "Reject", arValue: 'رفض');
    addString(
      key: LangEnum.showMobile.name,
      enValue: "Show Phone Number",
      arValue: 'عرض رقم الجوال',
    );
    addString(
      key: LangEnum.notAvailableInBranch.name,
      enValue: "Not Available In Some Branches",
      arValue: 'غير متوفر فى أحد الفروع',
    );
    addString(
      key: LangEnum.notAvailable.name,
      enValue: "Not Available",
      arValue: 'غير متوفر',
    );
    addString(
      key: LangEnum.chooseAnotherAddress.name,
      enValue: "Choose Another Address",
      arValue: 'اختيار عنوان اخر للتوصيل',
    );
    addString(
      key: LangEnum.noBranchesInThisAreaDesc.name,
      enValue:
          "You can choose another address for delivery or collection from the branch",
      arValue: 'يمكنك اختيار عنوان اخر للتوصيل او الاستلام من الفرع',
    );
    addString(
      key: LangEnum.noBranchesInThisArea.name,
      enValue: "This area is out of range",
      arValue: 'هذه المنطقة خارج نطاق التوصيل',
    );
    addString(
      key: LangEnum.discountPercentage.name,
      enValue: "Discount Percentage",
      arValue: 'نسبة الخصم',
    );
    addString(
      key: LangEnum.similar.name,
      enValue: "Similar Product",
      arValue: 'منتجات مشابهة',
    );
    addString(
      key: LangEnum.branchDetails.name,
      enValue: "Branch Details",
      arValue: 'تفاصيل الفرع',
    );
    addString(
      key: LangEnum.mustSelectRate.name,
      enValue: "You must specify the rating",
      arValue: 'يجب عليك تحديد التقييم',
    );
    addString(
        key: LangEnum.products.name, enValue: "products", arValue: 'المنتجات');
    addString(
        key: LangEnum.facility.name, enValue: "facility", arValue: 'منشأه');
    addString(
        key: LangEnum.individual.name, enValue: "individual", arValue: 'فرد');
    addString(
        key: LangEnum.requiredText.name,
        enValue: "required",
        arValue: 'مطلوبة');
    addString(
      key: LangEnum.thereAreRequiredOptions.name,
      enValue: "There are required options, select one of them",
      arValue: 'يوجد خيارات مطلوبة, اختر واحد منهما',
    );
    addString(
      key: LangEnum.allItemsWillBeDeleted.name,
      enValue: "All items in the cart will be deleted",
      arValue: 'جميع الأصناف في السلة سوف يتم حذفها',
    );
    addString(
      key: LangEnum.wantChangeReceiptMethod.name,
      enValue: "Do you want to change the receipt method?",
      arValue: 'هل تريد تغيير طريقة الاستلام؟',
    );
    addString(
      key: LangEnum.wantChangeBranch.name,
      enValue: "Do you want to change Branch?",
      arValue: 'هل تريد تغيير الفرع؟',
    );
    addString(
      key: LangEnum.paymentWhenReceiving.name,
      enValue: "Payment when receiving",
      arValue: 'الدفع عند الاستلام',
    );
    addString(
      key: LangEnum.visa.name,
      enValue: "Visa",
      arValue: 'فيزا',
    );
    addString(
        key: LangEnum.addedToCart.name,
        enValue: "Added To Cart",
        arValue: 'تم الاضافة للسلة');
    addString(
      key: LangEnum.emptyCartSuggest.name,
      enValue: "Let us suggest you kofah varieties",
      arValue: 'دعنا نقترح عليك أصناف كوفه',
    );
    addString(
      key: LangEnum.emptyCart.name,
      enValue: "Your shopping cart is empty!",
      arValue: 'سلة الشراء فارغة!',
    );
    addString(
      key: LangEnum.letSuggestOtherVarietiesForYou.name,
      enValue: "Let us suggest other varieties for you",
      arValue: 'دعنا نقترح عليك أصناف اخرى',
    );
    addString(
      key: LangEnum.noSearchResults.name,
      enValue: "There are no search results !",
      arValue: ' لا توجد نتائج بحث !',
    );
    addString(
      key: LangEnum.enterNameSearchBox.name,
      enValue: "Enter his name in the search box",
      arValue: 'ادخل اسمه في مربع البحث',
    );
    addString(
      key: LangEnum.searchingSpecificProduct.name,
      enValue: "Searching for a specific product",
      arValue: 'تبحث عن صنف محدد',
    );
    addString(
      key: LangEnum.loginRegistration.name,
      enValue: "Login/new registration",
      arValue: 'تسجيل دخول/ تسجيل جديد',
    );
    addString(
      key: LangEnum.notAvailableNow.name,
      enValue: "The item is not available now",
      arValue: 'الصنف غير متاح الآن',
    );
    addString(
      key: LangEnum.notAvailableThisTime.name,
      enValue: "The item is not available at this hour",
      arValue: 'الصنف غير متاح فى هذه الساعة',
    );
    addString(
      key: LangEnum.noInvoice.name,
      enValue: "Sorry, there is no invoice to be displayed",
      arValue: 'عذرا لا يوجد فاتوره حتي يتم عرضها',
    );
    addString(
      key: LangEnum.canceled.name,
      enValue: "Canceled",
      arValue: 'ملغي',
    );
    addString(
      key: LangEnum.delivered.name,
      enValue: "Delivered",
      arValue: 'تم التوصيل',
    );
    addString(
      key: LangEnum.pending.name,
      enValue: "Your order is on the way",
      arValue: 'طلبكم في الطريق',
    );
    addString(
      key: LangEnum.prepared.name,
      enValue: "The order has been processed",
      arValue: 'تم تجهيز الطلب',
    );
    addString(
      key: LangEnum.paid.name,
      enValue: "Payment completed successfully",
      arValue: 'تم الدفع بنجاح',
    );
    addString(
      key: LangEnum.receivedAndPreparing.name,
      enValue:
          "The request has been received successfully and is being processed",
      arValue: 'تم استلام الطلب بنجاح وجاري التجهيز',
    );
    addString(
      key: LangEnum.pendingForCustomerPay.name,
      enValue: "Waiting for payment",
      arValue: 'في انتظار السداد',
    );
    addString(
      key: LangEnum.pendingForAcceptOrder.name,
      enValue: "Waiting for order to be accepted",
      arValue: 'في انتظار قبول الطلب',
    );
    addString(
      key: LangEnum.thereAreNoAddresses.name,
      enValue: "There are no addresses.",
      arValue: 'لا يوجد لديك عناوين.',
    );
    addString(
      key: LangEnum.permissionLocationTitle.name,
      enValue: "You must first activate location permission",
      arValue: 'يجب عليك اولا تفعيل اذن الموقع',
    );
    addString(
      key: LangEnum.offers.name,
      enValue: "Offers",
      arValue: 'العروض',
    );
    addString(
      key: LangEnum.allCategory.name,
      enValue: "All Category",
      arValue: 'كل الأصناف',
    );
    addString(
      key: LangEnum.category.name,
      enValue: "Category",
      arValue: 'القسم',
    );

    addString(
      key: LangEnum.noNotifications.name,
      enValue: "No Notifications",
      arValue: 'لا توجد اشعارات',
    );
    addString(
      key: LangEnum.paymentCompletedSuccessfullyDesc.name,
      enValue:
          "You can view the order details by going to the My Orders screen",
      arValue: 'يمكنك الإطلاع على تفاصيل الطلب عن طريق الذهاب إلى شاشة طلباتي',
    );
    addString(
      key: LangEnum.perfectTimeForDelivery.name,
      enValue: "Perfect Time For Delivery",
      arValue: 'الوقت المناسب للتوصيل',
    );
    addString(
      key: LangEnum.clickToSelectTheDate.name,
      enValue: "Click To Select The Date",
      arValue: 'اضغط لتحديد التاريخ',
    );
    addString(
      key: LangEnum.suitableDateForDelivery.name,
      enValue: "Suitable Date For Delivery",
      arValue: 'التاريخ المناسب للتوصيل',
    );
    addString(
        key: LangEnum.changeAddress.name,
        enValue: "Change Address",
        arValue: 'تغيير العنوان');
    addString(
        key: LangEnum.homeDelivery.name,
        enValue: "Home Delivery",
        arValue: 'توصيل للمنزل');
    addString(
        key: LangEnum.receiptFromBranch.name,
        enValue: "Pickup",
        arValue: 'استلام من الفرع');
    addString(
        key: LangEnum.deliveryMethod.name,
        enValue: "Delivery Method",
        arValue: 'طريقة التوصيل');
    addString(
        key: LangEnum.addMore.name,
        enValue: "Add More",
        arValue: 'إضافة المزيد');
    addString(key: LangEnum.total.name, enValue: "Total", arValue: 'الاجمالي');
    addString(
        key: LangEnum.continueShopping.name,
        enValue: "Continue Shopping",
        arValue: 'متابعة التسوق');
    addString(
        key: LangEnum.viewCart.name,
        enValue: "View Cart",
        arValue: 'معاينة السلة');
    addString(
      key: LangEnum.toCartSuccessfully.name,
      enValue: "to your shopping cart successfully",
      arValue: 'إلي سلة الشراء بنجاح',
    );
    addString(key: LangEnum.added.name, enValue: "Added", arValue: 'تم اضافة');
    addString(key: LangEnum.hours.name, enValue: "Hours", arValue: 'ساعات');
    addString(key: LangEnum.gram.name, enValue: "Gram", arValue: 'جرام');
    addString(
        key: LangEnum.averageSize.name,
        enValue: "Average Size",
        arValue: 'متوسط الحجم');
    addString(
        key: LangEnum.processingTime.name,
        enValue: "Processing Time",
        arValue: 'مدة التجهيز');
    addString(
        key: LangEnum.productCode.name,
        enValue: "Product Code",
        arValue: 'كود المنتج');
    addString(
        key: LangEnum.oldestToNewest.name,
        enValue: "From oldest to newest",
        arValue: 'من الأقدم إلى الأحدث');
    addString(
        key: LangEnum.newestToOldest.name,
        enValue: "From newest to oldest",
        arValue: 'من الأحدث إلى الأقدم');
    addString(
        key: LangEnum.sortBy.name, enValue: "Sort By", arValue: 'الترتيب حسب');
    addString(key: LangEnum.search.name, enValue: "Search", arValue: 'البحث');
    addString(
        key: LangEnum.customerReviews.name,
        enValue: "Customer Reviews",
        arValue: 'أراء العملاء');
    addString(
        key: LangEnum.mostWanted.name,
        enValue: "Most Wanted",
        arValue: 'الأكثر طلبًا');
    addString(
        key: LangEnum.showMore.name,
        enValue: "Show More",
        arValue: 'عرض المزيد');
    addString(
        key: LangEnum.latestOffers.name,
        enValue: "Latest Offers",
        arValue: 'آخر العروض');
    addString(
        key: LangEnum.causeOfProblem.name,
        enValue: "Cause of problem",
        arValue: 'سبب المشكلة');
    addString(
        key: LangEnum.reasonForCancellation.name,
        enValue: "Reason for cancellation",
        arValue: 'سبب الإلغاء');
    addString(
      key: LangEnum.anotherReasonDesc.name,
      enValue:
          "Enter a text description for the report of at least 250 characters",
      arValue: 'ادخل وصف نصي للبلاغ لا يقل عن 250 حرف',
    );
    addString(
        key: LangEnum.reportProblem.name,
        enValue: "Report a problem",
        arValue: 'الإبلاغ عن مشكلة');
    addString(
      key: LangEnum.rateOrderDescription.name,
      enValue: "Your rating always helps us improve our service level",
      arValue: 'تقييمك يساعدنا دائمًا على تحسين مستوى الخدمة',
    );
    addString(
      key: LangEnum.rateCommentHint.name,
      enValue: "Add your comments about the service",
      arValue: 'اضف ملاحظاتك على الخدمة',
    );
    addString(
      key: LangEnum.cashOnDeliveryFees.name,
      enValue: "Cash on delivery fees",
      arValue: 'رسوم الدفع عند الإستلام',
    );
    addString(
        key: LangEnum.download.name, enValue: "Download", arValue: 'تحميل');
    addString(
        key: LangEnum.taxInvoice.name,
        enValue: "Tax Invoice",
        arValue: 'الفاتورة الضريبية');
    addString(
        key: LangEnum.paymentDateTime.name,
        enValue: "Payment DateTime",
        arValue: 'تاريخ ووقت الدفع');
    addString(
        key: LangEnum.amountPaid.name,
        enValue: "Amount paid",
        arValue: 'المبلغ المدفوع');
    addString(
        key: LangEnum.paymentDetails.name,
        enValue: "Payment Details",
        arValue: 'تفاصيل الدفع');
    addString(
        key: LangEnum.showOnMap.name,
        enValue: "Show On Map",
        arValue: 'عرض علي الخريطة');
    addString(
        key: LangEnum.geolocation.name,
        enValue: "Geolocation",
        arValue: 'الموقع الجغرافي');
    addString(
        key: LangEnum.deliveryDetails.name,
        enValue: "Delivery Details",
        arValue: 'تفاصيل التوصيل');
    addString(
        key: LangEnum.downloadInvoice.name,
        enValue: "Download Invoice",
        arValue: 'تحميل الفاتورة');
    addString(
        key: LangEnum.addressDescription.name,
        enValue: "Address Description",
        arValue: 'وصف العنوان');
    addString(
        key: LangEnum.recipientName.name,
        enValue: "Name of recipient",
        arValue: 'اسم المستلم');
    addString(
        key: LangEnum.addressName.name,
        enValue: "Address Name",
        arValue: 'اسم العنوان');
    addString(
        key: LangEnum.paymentHistory.name,
        enValue: "Payment History",
        arValue: 'سجل المدفوعات');
    addString(
        key: LangEnum.favorites.name, enValue: "Favorites", arValue: 'المفضلة');
    addString(
      key: LangEnum.commercialRegistrationImg.name,
      enValue: "A copy of the commercial register",
      arValue: 'صورة السجل التجاري',
    );
    addString(
      key: LangEnum.commercialRegistrationNo.name,
      enValue: "Commercial Registration No",
      arValue: 'رقم السجل التجاري',
    );
    addString(
        key: LangEnum.accountType.name,
        enValue: "Account Type",
        arValue: 'نوع الحساب');
    addString(
        key: LangEnum.newRegister.name,
        enValue: "Register New Account",
        arValue: 'تسجيل جديد');
    addString(
        key: LangEnum.loginAsGuest.name,
        enValue: "Login As Guest",
        arValue: 'الدخول كزائر');
    addString(key: LangEnum.done.name, enValue: "Done", arValue: 'تم');
    addString(
      key: LangEnum.notificationAlertDes.name,
      enValue: "A new application has been received and is awaiting approval",
      arValue: 'لقد تم استلام طلب جديد في انتظار الموافقة',
    );
    addString(
      key: LangEnum.cancelOrder.name,
      enValue: "Cancel Orders",
      arValue: 'طلبات ملغية',
    );
    addString(
      key: LangEnum.completedOrder.name,
      enValue: "Completed Orders",
      arValue: 'طلبات مكتملة',
    );
    addString(
      key: LangEnum.requestsProgress.name,
      enValue: "Requests in progress",
      arValue: 'طلبات قيد التنفيذ',
    );
    addString(
      key: LangEnum.talabatLocal.name,
      enValue: "Dining Orders",
      arValue: 'طلبات محلي',
    );
    addString(
      key: LangEnum.sefaryOrder.name,
      enValue: "Takeaway Orders",
      arValue: 'طلبات سفري',
    );
    addString(
      key: LangEnum.deliveryRequests.name,
      enValue: "Delivery requests",
      arValue: 'طلبات توصيل',
    );
    addString(
      key: LangEnum.newOrders.name,
      enValue: "New Orders",
      arValue: 'طلبات جديدة',
    );
    addString(
      key: LangEnum.totalBranchRequests.name,
      enValue: "Total branch requests",
      arValue: 'إجمالي طلبات الفرع',
    );
    addString(
      key: LangEnum.todayStatistics.name,
      enValue: "Today's Statistics",
      arValue: 'احصائيات اليوم',
    );
    addString(
        key: LangEnum.saturday.name, enValue: 'Saturday', arValue: 'السبت');
    addString(key: LangEnum.friday.name, enValue: 'Friday', arValue: 'الجمعة');
    addString(
        key: LangEnum.thursday.name, enValue: 'Thursday', arValue: 'الخميس');
    addString(
        key: LangEnum.wednesday.name,
        enValue: 'Wednesday',
        arValue: 'الأربعاء');
    addString(
        key: LangEnum.tuesday.name, enValue: 'Tuesday', arValue: 'الثلاثاء');
    addString(key: LangEnum.monday.name, enValue: 'Monday', arValue: 'الأثنين');
    addString(key: LangEnum.sunday.name, enValue: 'Sunday', arValue: 'الأحد');
    addString(
        key: LangEnum.workTime.name,
        enValue: 'Work Time',
        arValue: 'مواقيت العمل');
    addString(
        key: LangEnum.reports.name, enValue: 'Reports', arValue: 'التقارير');
    addString(
        key: LangEnum.administration.name,
        enValue: 'Administration',
        arValue: 'الإدارة');
    addString(
        key: LangEnum.peakTime.name,
        enValue: 'Peak time',
        arValue: 'وقت الذروة');
    addString(
        key: LangEnum.deliveryLogin.name, enValue: 'Login', arValue: 'دخول');
    addString(
      key: LangEnum.maintenanceStatus.name,
      enValue: 'Maintenance status of the branch',
      arValue: 'حالة الصيانة للفرع',
    );
    addString(
        key: LangEnum.orderMore.name,
        enValue: 'Order More',
        arValue: 'اطلب المزيد');
    addString(
      key: LangEnum.confirmOrderAndPay.name,
      enValue: 'confirm order and pay',
      arValue: 'تأكيد الطلب والدفع',
    );
    addString(
        key: LangEnum.ifAvailable.name,
        enValue: '(if Available)',
        arValue: '(ان وجدت)');
    addString(key: LangEnum.inHome.name, enValue: 'Takeaway', arValue: 'سفري');
    addString(key: LangEnum.inShop.name, enValue: 'Dining', arValue: 'محلي');
    addString(
      key: LangEnum.processingTimeDes.name,
      enValue: 'Expected processing time for the order',
      arValue: 'الوقت المتوقع لتجهيز الطلب ',
    );
    addString(
      key: LangEnum.commentsHint.name,
      enValue: 'Add your comments about the service',
      arValue: 'اضف ملاحظاتك على الخدمة',
    );
    addString(
        key: LangEnum.excellent.name, enValue: 'excellent', arValue: 'ممتاز');
    addString(key: LangEnum.good.name, enValue: 'good', arValue: 'جيد');
    addString(
        key: LangEnum.acceptable.name, enValue: 'acceptable', arValue: 'مقبول');
    addString(
        key: LangEnum.notSatisfied.name,
        enValue: 'not satisfied',
        arValue: 'غير راضي');
    addString(
      key: LangEnum.distinguishedCustomerDes.name,
      enValue:
          'As a distinguished customer, your opinion matters to us to improve the quality of service',
      arValue: 'كونك من العملاء المميزين فرأيك يهمنا لتحسين جودة الخدمة',
    );
    addString(
        key: LangEnum.orderAgain.name,
        enValue: 'Order Again',
        arValue: 'طلب مرة اخرى');
    addString(
      key: LangEnum.completePayment.name,
      enValue: 'Complete the payment process',
      arValue: 'استكمال عملية الدفع',
    );
    addString(
      key: LangEnum.changeOrderStatus.name,
      enValue: 'change order status',
      arValue: 'تغيير حالة الطلب',
    );
    addString(
        key: LangEnum.clientNotes.name,
        enValue: 'Client Notes',
        arValue: 'ملاحظات العميل');
    addString(
        key: LangEnum.orderItems.name,
        enValue: 'Order items',
        arValue: 'عناصر الطلب');
    addString(
      key: LangEnum.commentsSuggestions.name,
      enValue: 'Comments or suggestions',
      arValue: 'تعليقات أو اقتراحات',
    );
    addString(
      key: LangEnum.qualityOfService.name,
      enValue: 'Quality of service',
      arValue: 'جودة الخدمة',
    );
    addString(
      key: LangEnum.howToApply.name,
      enValue: 'How to apply',
      arValue: 'طريقة التقديم',
    );
    addString(
      key: LangEnum.foodQuality.name,
      enValue: 'Food quality',
      arValue: 'جودة الطعام',
    );
    addString(
      key: LangEnum.rateOrder.name,
      enValue: 'Rate Order',
      arValue: 'تقييم الطلب',
    );
    addString(
      key: LangEnum.expectedTime.name,
      enValue: 'Expected processing time',
      arValue: 'الوقت المتوقع للتجهيز',
    );
    addString(
        key: LangEnum.clientName.name,
        enValue: 'Client Name',
        arValue: 'اسم العميل');
    addString(
        key: LangEnum.deliveryAddress.name,
        enValue: 'Delivery Address',
        arValue: 'عنوان التوصيل');
    addString(
        key: LangEnum.deliveryCharge.name,
        enValue: 'Delivery',
        arValue: 'قيمة التوصيل');
    addString(
      key: LangEnum.orderInformation.name,
      enValue: 'Order Information',
      arValue: 'بيانات الطلب',
    );
    addString(
      key: LangEnum.acceptedOrderDes.name,
      enValue:
          'Your request has been successfully accepted. Please complete the payment',
      arValue: 'تم قبول طلبكم بنجاح يرجي استكمال الدفع',
    );
    addString(
      key: LangEnum.messageAddress.name,
      enValue: 'Message Address',
      arValue: 'عنوان الرسالة',
    );
    addString(
      key: LangEnum.messageType.name,
      enValue: 'Message Type',
      arValue: 'نوع الرسالة',
    );
    addString(
      key: LangEnum.loginNowAndEnjoy.name,
      enValue: 'Log in now and enjoy Kufa meals',
      arValue: 'سجل دخول الآن واستمتع بوجبات كوفه',
    );
    addString(
      key: LangEnum.followOrder.name,
      enValue:
          'You can follow up on order confirmation through the My Orders screen',
      arValue: 'يمكنكم متابعة تأكيد الطلب من خلال شاشة طلباتي',
    );
    addString(
      key: LangEnum.orderNumberIs.name,
      enValue: 'The order number is',
      arValue: 'رقم الطلب هو',
    );
    addString(
      key: LangEnum.pleaseWait.name,
      enValue: 'Please wait until your order is confirmed',
      arValue: 'يرجى الإنتظار حتى يتم تأكيد طلبكم',
    );
    addString(
      key: LangEnum.completeYourMeal.name,
      enValue: 'Complete Your Meal',
      arValue: 'أكمل وجبتك',
    );
    addString(
      key: LangEnum.createNewAccount.name,
      enValue: 'Register a new account',
      arValue: 'تسجيل حساب جديد',
    );
    addString(
      key: LangEnum.registerBtn.name,
      enValue: 'Register ',
      arValue: 'تسجيل ',
    );
    addString(
      key: LangEnum.iHaveReadAndAgreeTo.name,
      enValue: 'By registering with us, you agree to',
      arValue: 'تسجيلك لدينا يعني موافقتك على ',
    );
    addString(
      key: LangEnum.skipLogin.name,
      enValue: 'Skip login',
      arValue: 'تخطي تسجيل الدخول',
    );
    addString(
      key: LangEnum.onboardTitle1.name,
      enValue: 'Become a delegate with taxi24.',
      arValue: 'كن مندوبًا مع سلة تاكسى24.',
    );
    addString(
      key: LangEnum.onboardTitle2.name,
      enValue: 'Easier user experience.',
      arValue: 'تجربة المستخدم الأسهل.',
    );
    addString(
      key: LangEnum.onboardTitle3.name,
      enValue: 'Incentive commissions.',
      arValue: 'عمولات محفزة.',
    );
    addString(
      key: LangEnum.onboardDes1.name,
      arValue: 'مزايا رائعة وعمولات اضافية عندما تصبح مندوبًا مع سلة تاكسى24.',
      enValue:
          "Great benefits and additional commissions when you become a representative with taxi24.",
    );
    addString(
      key: LangEnum.onboardDes3.name,
      enValue:
          'Get additional incentive commissions when you complete more orders.',
      arValue: 'احصل على عمولات إضافية محفزة عند انجازك المزيد من الطلبات.',
    );
    addString(
      key: LangEnum.onboardDes2.name,
      enValue:
          'You can manage your orders and know your business statistics in detail and with ease.',
      arValue: 'يمكنك إدارة طلباتك ومعرفة احصائيات عملك بالتفصيل وبكل سهولة.',
    );
    addString(
      key: LangEnum.registerNow.name,
      enValue: 'Register Now',
      arValue: 'سجل الآن',
    );
    addString(
        key: LangEnum.addresses.name, enValue: 'Addresses', arValue: 'عناويني');
    addString(
        key: LangEnum.shareApp.name,
        enValue: 'Share App',
        arValue: 'شارك التطبيق');
    addString(
        key: LangEnum.rateApp.name,
        enValue: 'Rate App',
        arValue: 'قيم التطبيق على المتجر');
    addString(
        key: LangEnum.aboutAppName.name,
        enValue: 'About Kufa',
        arValue: 'عن كوفه');
    addString(
        key: LangEnum.neighborhood.name,
        enValue: 'Neighborhood',
        arValue: 'الحي');
    addString(
        key: LangEnum.street.name, enValue: 'Street', arValue: 'اسم الشارع');
    addString(
        key: LangEnum.buildingNumber.name,
        enValue: 'Building number',
        arValue: 'رقم البناية');
    addString(
        key: LangEnum.floorNumber.name,
        enValue: 'Floor number',
        arValue: 'رقم الطابق');
    addString(
        key: LangEnum.delegateNotes.name,
        enValue: 'Delegate notes',
        arValue: 'ملاحظات للمندوب');
    addString(
      key: LangEnum.contactInformation.name,
      enValue: 'Contact information',
      arValue: 'تواصل معنا عبر',
    );
    addString(
        key: LangEnum.followUsOnSocialS.name,
        enValue: 'Follow us',
        arValue: 'تابعنا على');
    addString(key: LangEnum.digits.name, enValue: "digits", arValue: 'رقم');
    addString(
        key: LangEnum.mustContain.name,
        enValue: "It must consist of",
        arValue: 'يجب ان يتكون من');
    addString(
      key: LangEnum.paymentStatus.name,
      enValue: "Payment Status",
      arValue: 'حاله الدفع',
    );
    addString(key: LangEnum.file.name, enValue: "File", arValue: 'ملف');
    addString(
        key: LangEnum.attached.name,
        enValue: "Attached",
        arValue: 'تم ارفاقها');
    addString(
        key: LangEnum.attachFile.name,
        enValue: "Attach File",
        arValue: 'إرفاق ملف');
    addString(key: LangEnum.saudi.name, enValue: 'Saudi', arValue: 'سعودي');
    addString(key: LangEnum.minute.name, enValue: 'Minute', arValue: 'دقيقة');
    addString(key: LangEnum.female.name, enValue: 'Female', arValue: 'أنثي');
    addString(key: LangEnum.male.name, enValue: 'Male', arValue: 'ذكر');
    addString(
        key: LangEnum.receivingMethod.name,
        enValue: 'Receiving method',
        arValue: 'طريقة الاستلام');
    addString(
        key: LangEnum.receiving.name, enValue: 'Delivery  ', arValue: ' توصيل');
    addString(
        key: LangEnum.fromBranch.name,
        enValue: 'Pickup',
        arValue: 'استلام من الفرع');
    addString(
        key: LangEnum.itemComponents.name,
        enValue: 'Item components',
        arValue: 'مكونات الصنف');
    addString(
        key: LangEnum.mealType.name,
        enValue: 'Meal type',
        arValue: 'نوع الوجبة');
    addString(
        key: LangEnum.required.name, enValue: 'Required', arValue: 'اجباري');
    addString(key: LangEnum.hot.name, enValue: 'Hot', arValue: 'حار');
    addString(
        key: LangEnum.cold.name, enValue: 'Cold', arValue: 'Normal - بارد');
    addString(
      key: LangEnum.addIngredient.name,
      enValue: 'Add   ingredient',
      arValue: 'هل تريد عدم إضافة أي مكون من الوجبة؟',
    );
    addString(
      key: LangEnum.chooseBranch.name,
      enValue: 'Choose the branch closest to you from the list',
      arValue: 'اختر الفرع الأقرب إليك من القائمة',
    );
    addString(
        key: LangEnum.exploreMenu.name,
        enValue: 'Explore the menu',
        arValue: 'استكشف القائمة');
    addString(
      key: LangEnum.paymentCompletedSuccessfully.name,
      enValue: 'Payment completed successfully',
      arValue: 'تم الدفع بنجاح',
    );
    addString(
      key: LangEnum.failedToPay.name,
      enValue: 'Failed To Pay, please try again',
      arValue: 'فشل في الدفع, يرجي المحاولة مرة أخري',
    );
    addString(
      key: LangEnum.dotYouWantToSignOut.name,
      enValue: 'Do you want to log out of the app?',
      arValue: 'هل أنت متأكد أنك تريد تسجيل خروج؟',
    );
    addString(
      key: LangEnum.dotYouWantToDeleteAccount.name,
      enValue: 'Do you want to delete the account?',
      arValue: 'هل أنت متأكد أنك تريد حذف الحساب؟',
    );
    addString(
      key: LangEnum.shoppingCart.name,
      enValue: "Shopping Cart",
      arValue: 'سلة الشراء',
    );
    addString(
        key: LangEnum.finishOrder.name,
        enValue: "Finish Order",
        arValue: 'انهاء الطلب');
    addString(
      key: LangEnum.uploadFromGallery.name,
      enValue: "Upload From Gallery",
      arValue: 'إختيار من معرض الصور',
    );
    addString(
      key: LangEnum.takePhoto.name,
      enValue: "Take Photo by Camera",
      arValue: 'إلتقاط صورة بواسطة الكاميرا',
    );
    addString(
        key: LangEnum.deleteAccount.name,
        enValue: "Delete Account",
        arValue: 'حذف الحساب');
    addString(key: LangEnum.delete.name, enValue: "Delete", arValue: 'حذف ');
    addString(
        key: LangEnum.signOut.name, enValue: "Sign Out", arValue: 'تسجيل خروج');
    addString(
        key: LangEnum.totalProducts.name,
        enValue: "Total Products",
        arValue: 'إجمالي المنتجات');
    addString(
      key: LangEnum.orderDetails.name,
      enValue: 'order details',
      arValue: 'تفاصيل الطلب',
    );
    addString(
      key: LangEnum.showOrderDetails.name,
      enValue: 'Show order details',
      arValue: 'عرض تفاصيل الطلب',
    );
    addString(
      key: LangEnum.printInvoice.name,
      enValue: 'Print invoice',
      arValue: 'طباعة الفاتورة',
    );
    addString(
      key: LangEnum.deliverAlert.name,
      enValue: 'Log in to use your registered addresses',
      arValue: ' سجل دخول لإستخدام عناوينك المسجلة ',
    );
    addString(
        key: LangEnum.address.name, enValue: 'Address', arValue: 'العنوان');
    addString(
      key: LangEnum.pressAgainToExit.name,
      enValue: 'Press again to exit app',
      arValue: 'إضغط مرة أخري للخروج من التطبيق',
    );
    addString(
        key: LangEnum.searchHint.name,
        enValue: 'Search...',
        arValue: 'ابحث...');
    addString(
      key: LangEnum.searchResultsFor.name,
      enValue: 'Search results for:',
      arValue: 'نتائج البحث لـ :',
    );
    addString(
      key: LangEnum.searchForLocation.name,
      enValue: 'Search For Location ',
      arValue: 'البحث عن الموقع',
    );
    addString(
        key: LangEnum.mobileHint.name,
        enValue: '5xxxxxxxx',
        arValue: '5xxxxxxxx');
    addString(
        key: LangEnum.totalDue.name,
        enValue: 'total due',
        arValue: 'الإجمالي المستحق');
    addString(
      key: LangEnum.valueAddedTax.name,
      enValue: 'Value added tax',
      arValue: 'ضريبة القيمة المضافة',
    );
    addString(
        key: LangEnum.orderCost.name,
        enValue: 'order cost',
        arValue: 'تكلفة الطلب');
    addString(
        key: LangEnum.paymentMethod.name,
        enValue: 'payment method',
        arValue: 'طريقة الدفع');
    addString(
        key: LangEnum.completeOrder.name,
        enValue: 'Complete Order',
        arValue: 'اتمام الطلب');
    addString(key: LangEnum.welcome.name, enValue: 'Welcome', arValue: 'أهلاً');
    addString(
        key: LangEnum.categories.name,
        enValue: 'Categories',
        arValue: 'الأقسام');
    addString(
        key: LangEnum.loginNow.name,
        enValue: 'Login Now',
        arValue: 'سجل دخول الآن');
    addString(
        key: LangEnum.haveAnAccount.name,
        enValue: 'Have an account',
        arValue: 'لديك حساب');
    addString(
        key: LangEnum.toastAddFavMessage.name,
        enValue: 'Added to favorites list',
        arValue: 'تمت الإضافه الى قائمتك المفضله');
    addString(
        key: LangEnum.toastRemoveFavMessage.name,
        enValue: 'Removed from favorites list',
        arValue: 'تمت الإزاله من قائمتك المفضله');
    addString(
        key: LangEnum.toastRateMessage.name,
        enValue: 'Evaluation completed successfully',
        arValue: ' تم التقييم بنجاح');
    addString(
      key: LangEnum.contactFormTitle.name,
      enValue: 'Do You have a question?',
      arValue: 'لديك سؤال أو استفسار؟',
    );
    addString(
      key: LangEnum.contactFormNewTitle.name,
      enValue: 'Do You have a question?',
      arValue: 'لديك استفسار أو اقتراح؟',
    );
    addString(
      key: LangEnum.contactFormSecondTitle.name,
      enValue: 'Do not hesitate to contact us, we are here to serve you',
      arValue: 'لا تتردد في الاتصال بنا، نحن هنا في خدمتك',
    );
    addString(
        key: LangEnum.message.name,
        enValue: 'Message',
        arValue: '  نص الرسالة');
    addString(key: LangEnum.name.name, enValue: 'Name', arValue: 'الاسم ');
    addString(
        key: LangEnum.addToCart.name,
        enValue: 'Add To Cart',
        arValue: 'اضف إلى السلة');
    addString(key: LangEnum.riyal.name, enValue: 'Riyal', arValue: 'ريال');
    addString(key: LangEnum.discount.name, enValue: 'discount', arValue: 'خصم');
    addString(
        key: LangEnum.viewAll.name, enValue: 'view all', arValue: 'عرض الكل');
    addString(
      key: LangEnum.copyRight.name,
      enValue: '© Abdulaziz Al-Dhafer Al-Omari Law Firm 2023',
      arValue: '© شركة عبدالعزيز الظافر العمري للمحاماة 2023',
    );
    addString(
        key: LangEnum.contactUs.name,
        enValue: 'Contact Us',
        arValue: 'اتصل بنا');
    addString(
        key: LangEnum.privacyPolicy.name,
        enValue: 'Privacy Policy',
        arValue: 'سياسة الخصوصية');
    addString(
        key: LangEnum.faq.name, enValue: 'FAQ', arValue: 'الأسئلة الشائعة');
    addString(
        key: LangEnum.faqNoResults.name,
        enValue: 'No Results Found',
        arValue: 'لا توجد أسئلة ');
    addString(
        key: LangEnum.orderNumber.name,
        enValue: 'Order number',
        arValue: 'رقم الطلب');
    addString(
        key: LangEnum.orderStatus.name,
        enValue: 'Order status',
        arValue: 'حالة الطلب');
    addString(
        key: LangEnum.orderDateTime.name,
        enValue: 'Order date and time',
        arValue: 'تاريخ ووقت الطلب');
    addString(
        key: LangEnum.downloading.name,
        enValue: 'Downloading...',
        arValue: 'جاري التحميل...');
    addString(
        key: LangEnum.failed.name,
        enValue: 'Download Faild',
        arValue: 'فشل في التحميل');
    addString(
      key: LangEnum.priceWithTax.name,
      enValue: 'Price with tax',
      arValue: ' السعر شامل ضريبة القيمة المضافة',
    );
    addString(key: LangEnum.notes.name, enValue: 'Notes', arValue: 'ملاحظات');
    addString(
        key: LangEnum.orderTotal.name,
        enValue: 'Order total',
        arValue: 'اجمالي الطلب');
    addString(
      key: LangEnum.locationOnMap.name,
      enValue: 'Location on the map',
      arValue: 'الموقع على الخريطة',
    );
    addString(
      key: LangEnum.locationOnMap.name,
      enValue: 'Location on the map',
      arValue: 'الموقع على الخريطة',
    );
    addString(key: LangEnum.help.name, enValue: 'Help', arValue: 'المساعدة');
    addString(
        key: LangEnum.language.name, enValue: 'Language', arValue: 'اللغة');
    addString(
        key: LangEnum.settings.name, enValue: 'Settings', arValue: 'الإعدادات');
    addString(
        key: LangEnum.notifications.name,
        enValue: 'Notifications',
        arValue: 'الإشعارات');
    addString(
        key: LangEnum.myOrders.name, enValue: 'My Orders', arValue: 'طلباتي');
    addString(
        key: LangEnum.editProfile.name,
        enValue: 'Edit Profile',
        arValue: 'تعديل بيانات الحساب');
    addString(
        key: LangEnum.myAccount.name, enValue: 'My Account', arValue: 'حسابي');
    addString(
      key: LangEnum.appName.name,
      enValue: 'Abdulaziz Al-Dhafer Al-Omari Law Firm',
      arValue: 'شركة عبدالعزيز الظافر العمري للمحاماة',
    );
    addString(
        key: LangEnum.addNewAddress.name,
        enValue: 'Add New Address',
        arValue: 'إضافة عنوان جديد');
    addString(key: LangEnum.save.name, enValue: 'Save', arValue: 'حفظ');
    addString(key: LangEnum.yes.name, enValue: 'Yes', arValue: 'نعم');
    addString(key: LangEnum.no.name, enValue: 'No', arValue: 'لا');
    addString(key: LangEnum.value.name, enValue: 'value', arValue: 'القيمة');
    addString(
      key: LangEnum.setAsDefaultAddress.name,
      enValue: 'Set as default address',
      arValue: 'تعيين كعنوان افتراضي',
    );
    addString(
      key: LangEnum.chooseLocationOnMap.name,
      enValue: 'Choose Location On Map',
      arValue: 'تحديد الموقع على الخريطة',
    );
    addString(
      key: LangEnum.chooseLocationOnMapBtn.name,
      enValue: 'Click here to select your location',
      arValue: 'اضغط هنا لتحديد الموقع',
    );
    addString(
        key: LangEnum.contactMobile.name,
        enValue: 'Contact Mobile',
        arValue: 'رقم التواصل');
    addString(
        key: LangEnum.address.name, enValue: 'Address', arValue: 'العنوان');
    addString(key: LangEnum.change.name, enValue: 'Change', arValue: 'تغيير');
    addString(key: LangEnum.home.name, enValue: 'Home', arValue: 'الرئيسية');
    addString(key: LangEnum.cart.name, enValue: 'Cart', arValue: 'السلة');
    addString(key: LangEnum.more.name, enValue: 'More', arValue: 'المزيد');
    addString(
      key: LangEnum.registerSuccessTitle.name,
      enValue: 'Your account has been successfully registered',
      arValue: 'تم تسجيل حسابك بنجاح',
    );
    addString(
      key: LangEnum.termsAndConditions.name,
      enValue: 'Terms & Conditions',
      arValue: 'الشروط والأحكام',
    );
    addString(
        key: LangEnum.createAccount.name,
        enValue: 'Create Account',
        arValue: 'إنشاء حساب');
    addString(
        key: LangEnum.chooseFromList.name,
        enValue: 'Choose',
        arValue: 'اختر من القائمة');
    addString(
        key: LangEnum.confirmPassword.name,
        enValue: 'Confirm Password',
        arValue: 'تأكيد كلمة المرور');
    addString(key: LangEnum.city.name, enValue: 'City', arValue: 'المدينة');
    addString(
        key: LangEnum.zone.name,
        enValue: 'Zone',
        arValue: 'المنطقة / المدينة ');
    addString(key: LangEnum.gender.name, enValue: 'Gender', arValue: 'الجنس');
    addString(
        key: LangEnum.email.name,
        enValue: 'E-Mail',
        arValue: 'البريد الإلكتروني');
    addString(
      key: LangEnum.confirmNewPassword.name,
      enValue: 'Confirm New Password',
      arValue: 'تأكيد كلمة المرور الجديدة',
    );
    addString(
        key: LangEnum.newPassword.name,
        enValue: 'New Password',
        arValue: 'كلمة المرور الجديدة');
    addString(
        key: LangEnum.reset.name, enValue: 'Reset', arValue: 'اعادة تعيين');
    addString(
      key: LangEnum.resetPassword.name,
      enValue: 'Reset Password',
      arValue: 'اعادة تعيين كلمة المرور',
    );
    addString(
        key: LangEnum.resendCode.name,
        enValue: 'Resend Code',
        arValue: 'إعادة إرسال الكود');
    addString(
      key: LangEnum.verifyDesc.name,
      enValue:
          'Enter the activation code sent to your mobile number to be able to reset the password',
      arValue:
          'قم بإدخال كود التفعيل المرسل على رقم جوالك لتتمكن من إعادة تعيين كلمة المرور',
    );
    addString(
      key: LangEnum.verifyMobileNumber.name,
      enValue: 'Verify Mobile Number',
      arValue: 'التحقق من رقم الجوال',
    );
    addString(key: LangEnum.send.name, enValue: 'Send', arValue: 'إرسال');
    addString(
        key: LangEnum.mobile.name, enValue: 'Mobile', arValue: 'رقم الجوال');
    addString(
      key: LangEnum.forgetPassDesc.name,
      enValue:
          'Please enter your mobile number and an activation code will be sent to reset your password',
      arValue:
          'فضلا قم بادخال رقم جوالك وسيتم إرسال كود التفعيل لإعادة تعيين كلمة المرور',
    );
    addString(key: LangEnum.loginBtn.name, enValue: 'Login', arValue: 'دخول');
    addString(
      key: LangEnum.forgetPassword.name,
      enValue: 'Forget Password?',
      arValue: 'هل نسيت كلمة المرور؟',
    );
    addString(
      key: LangEnum.changePassword.name,
      enValue: 'Change Password',
      arValue: 'تغيير كلمة المرور',
    );
    addString(
      key: LangEnum.currentPassword.name,
      enValue: 'Current Password',
      arValue: 'كلمة المرور الحالية',
    );
    addString(
      key: LangEnum.newPassword.name,
      enValue: 'New Password',
      arValue: 'كلمة المرور الجديدة',
    );
    addString(
      key: LangEnum.confirmNewPassword.name,
      enValue: 'Confirm New Password',
      arValue: 'تأكيد كلمة المرور الجديدة',
    );
    addString(
      key: LangEnum.email.name,
      enValue: 'Email',
      arValue: 'البريد الإلكتروني',
    );
    addString(
      key: LangEnum.saveChanges.name,
      enValue: 'Save Changes',
      arValue: 'حفظ التغييرات',
    );
    addString(
        key: LangEnum.password.name,
        enValue: 'Password',
        arValue: 'كلمة المرور');
    addString(
        key: LangEnum.registerNow.name,
        enValue: 'Register Now',
        arValue: 'سجل الآن');
    addString(
      key: LangEnum.doNotHaveAccount.name,
      enValue: 'Don\'t have account?',
      arValue: 'ليس لديك حساب؟',
    );
    addString(
        key: LangEnum.startNow.name,
        enValue: 'Start Now',
        arValue: 'إبدأ الآن');
    addString(key: LangEnum.skip.name, enValue: 'Skip', arValue: 'تخطي');
    addString(
        key: LangEnum.english.name, enValue: 'English', arValue: 'English');
    addString(
        key: LangEnum.arabic.name, enValue: 'العربية', arValue: 'العربية');
    addString(
        key: LangEnum.optional.name, enValue: 'Optional', arValue: 'اختياري');
    addString(
        key: LangEnum.options.name, enValue: 'Options', arValue: 'الخيارات');
    addString(
        key: LangEnum.mustLogin.name,
        enValue: 'Must Login',
        arValue: 'يجب تسجيل الدخول');
    addString(
        key: LangEnum.login.name, enValue: 'Login', arValue: 'تسجيل دخول');
    addString(
        key: LangEnum.termsOfUse.name,
        enValue: 'Terms Of Use',
        arValue: 'شروط الاستخدام');
    addString(key: LangEnum.cancel.name, enValue: 'Cancel', arValue: 'إلغاء');
    addString(key: LangEnum.confirm.name, enValue: 'Confirm', arValue: 'تأكيد');
    addString(
        key: LangEnum.favourite.name, enValue: 'Favourite', arValue: 'المفضلة');
    addString(
        key: LangEnum.appVersion.name,
        enValue: 'App version',
        arValue: 'اصدار التطبيق');
    addString(
        key: LangEnum.confirmLocation.name,
        enValue: 'Confirm location',
        arValue: 'تأكيد الموقع');
    addString(
        key: LangEnum.calories.name,
        enValue: 'Calories',
        arValue: 'السعرات الحرارية');
    addString(
        key: LangEnum.calorie.name, enValue: 'Calorie', arValue: 'سعر حراري');
    addString(
        key: LangEnum.allergens.name,
        enValue: 'Allergens',
        arValue: 'مسببات الحساسية');
    addString(
        key: LangEnum.orderNow.name,
        enValue: 'Order now',
        arValue: 'اطلب الآن');
    addString(
        key: LangEnum.noResults.name,
        enValue: 'No results',
        arValue: 'لاتوجد نتائج');
    addString(
        key: LangEnum.noBranches.name,
        enValue: 'No branches found',
        arValue: 'لاتوجد فروع');
    addString(
      key: LangEnum.notificationAlert.name,
      enValue: 'Do you want to delete notifications?',
      arValue: 'هل تريد حذف الإشعارات ؟ ',
    );
    addString(
      key: LangEnum.unableToServe.name,
      enValue: 'Available only from',
      arValue: 'متاح فقط من الساعة',
    );
    addString(
      key: LangEnum.until.name,
      enValue: 'until',
      arValue: 'حتي',
    );
    addString(
      key: LangEnum.outOfBusiness.name,
      enValue:
          'Sorry, we are currently out of business hours and cannot accept your orders.',
      arValue: 'نأسف، نحن الآن خارج أوقات العمل ولا يمكننا استقبال طلباتكم.',
    );
    addString(
      key: LangEnum.noInternet.name,
      enValue: 'Your Device Doesn\'t Connected To Internet ',
      arValue: 'جهازك غير متصل بالإنترنت',
    );
    addString(
      key: LangEnum.makeSureConnected.name,
      enValue: 'Make Sure Your Connection Working To Load Data ',
      arValue: 'تأكد من أن اتصالك يعمل لتحميل البيانات',
    );

    addString(
        key: LangEnum.myFatoorah.name,
        enValue: 'My Fatoorah',
        arValue: 'ماي فاتورة');
    addString(
      key: LangEnum.validatePhoneEmpty.name,
      enValue: 'Mobile is required.',
      arValue: 'رقم الجوال مطلوب.',
    );
    addString(
      key: LangEnum.validatePhoneStartValidator.name,
      enValue: 'Mobile must start with 5.',
      arValue: 'رقم الجوال يجب ان يبدأ برقم 5.',
    );
    addString(
      key: LangEnum.validatePhoneValidator.name,
      enValue: 'Mobile number must  be  9 numbers',
      arValue: 'رقم الجوال يجب أن يكون 9 أرقام',
    );
    addString(
      key: LangEnum.validatePassEmpty.name,
      enValue: "Password is required.",
      arValue: 'كلمة المرور مطلوبة.',
    );
    addString(
      key: LangEnum.validatePassRegExp.name,
      enValue:
          "It must contain at least one uppercase and lowercase letter and a symbol. Example: 12345@Ma",
      arValue: 'يجب ان تحتوي علي حرف كبير وصغير ورمز علي الأقل مثال: 12345@Ma',
    );
    addString(
      key: LangEnum.validatePasswordLength.name,
      enValue: "Mobile number must not be less than 8.",
      arValue: 'كلمة المرور يجب الا تكون اقل من 8.',
    );

    addString(
      key: LangEnum.validatePasswordNotMatch.name,
      enValue: "Password Not Match.",
      arValue: 'كلمة المرور غير متطابقة.',
    );

    addString(
      key: LangEnum.validateFieldRequired.name,
      enValue: "Field is required.",
      arValue: 'هذا الحقل مطلوب.',
    );
    addString(
      key: LangEnum.validateNote.name,
      enValue: 'Enter A Text Description Of At Least 150 Characters',
      arValue: 'ادخل وصف نصي لا يقل عن 150 حرف',
    );
    addString(
      key: LangEnum.validatePassRegExpLettersAndDigits.name,
      enValue: 'It must not contain symbols',
      arValue: 'يجب ألا تحتوي علي رموز',
    );

    addString(
      key: LangEnum.validateFieldRequired.name,
      enValue: "Field is required.",
      arValue: 'هذا الحقل مطلوب.',
    );
    addString(
      key: LangEnum.validateNameLength.name,
      enValue: 'Name must be greater than 3 character',
      arValue: 'يجب أن يكون الاسم أكبر من 3 أحرف',
    );
    addString(
      key: LangEnum.validateNameLengthNoNumber.name,
      enValue: 'Name must be greater than 3 character and no number',
      arValue: 'يجب أن يكون الاسم أكبر من 3 أحرف ولا يحتوي علي ارقام',
    );

    addString(
      key: LangEnum.validateEmail.name,
      enValue: "E-Mail not valid.",
      arValue: 'البريد الالكتروني غير صحيح.',
    );
    addString(
      key: LangEnum.sucessToastMessage.name,
      enValue: "Modified successfully",
      arValue: 'تم التعديل بنجاح',
    );

    addString(
      key: LangEnum.contactUsSuccessMsg.name,
      enValue: "Message sent  successfully",
      arValue: 'تم ارسال الرسالة  بنجاح ',
    );
    addString(
      key: LangEnum.theOrderNumber.name,
      enValue: "The Order Number",
      arValue: 'الطلب رقم',
    );
    addString(
      key: LangEnum.sortedBy.name,
      enValue: "Sort by",
      arValue: 'الفرز حسب',
    );
    addString(
      key: LangEnum.discountCouponValue.name,
      enValue: "Discount coupon value",
      arValue: 'قيمه كوبون الخصم',
    );
    addString(
      key: LangEnum.costValueAfterDiscount.name,
      enValue: "Cost value after discount",
      arValue: 'قيمه التكلفه بعد الخصم',
    );
    addString(
      key: LangEnum.cashDeliveryFees.name,
      enValue: "Cash on delivery fees",
      arValue: 'رسوم الدفع عند الاستلام',
    );
    addString(
      key: LangEnum.district.name,
      enValue: "District",
      arValue: 'الحي',
    );
    addString(
        key: LangEnum.sortAsc.name,
        enValue: 'Creation date from oldest to newest',
        arValue: 'تاريخ الإنشاء من الأقدم إلى الأحدث ');
    addString(
        key: LangEnum.sortDesc.name,
        enValue: 'Creation date from newest to oldest',
        arValue: 'تاريخ الإنشاء من الأحدث إلى الأقدم');
    addString(key: LangEnum.apply.name, enValue: 'apply', arValue: 'تطبيق');

    addString(
      key: LangEnum.appSlogan.name,
      enValue: "عمق الترابط!\nThe Power of Networking",
      arValue: "عمق الترابط!\nThe Power of Networking",
    );

    addString(key: LangEnum.ok.name, enValue: 'OK', arValue: 'حسنا');

    addString(
        key: LangEnum.areYouSure.name,
        enValue: 'Are you sure?',
        arValue: 'هل أنت متأكد؟');

    addString(key: LangEnum.edit.name, enValue: 'Edit', arValue: 'تعديل');
    addString(key: LangEnum.image.name, enValue: 'Image', arValue: 'صورة');

    addString(
        key: LangEnum.uploadError.name,
        enValue: 'Sorry this option is not available',
        arValue: 'عذرا, هذه الميزه غير متاحه');

    addString(
        key: LangEnum.fileTypeError.name,
        enValue: 'Sorry, file type not supported',
        arValue: 'عفواً, نوع الملف غير مدعم');

    addString(key: LangEnum.document.name, enValue: 'Document', arValue: 'ملف');
    addString(key: LangEnum.audio.name, enValue: 'Audio', arValue: 'صوت');

    addString(key: LangEnum.video.name, enValue: 'Video', arValue: 'فيديو');

    addString(
        key: LangEnum.somethingWrong.name,
        enValue: 'Something Wrong',
        arValue: 'شيء خاطئ');

    addString(
        key: LangEnum.connectionError.name,
        enValue: 'Connection Error',
        arValue: 'خطأ في الإتصال');

    addString(
      key: LangEnum.darkMode.name,
      enValue: 'Dark Mode',
      arValue: 'الوضع الداكن',
    );
    addString(
      key: LangEnum.lightMode.name,
      enValue: 'Light Mode',
      arValue: 'الوضع الفاتح',
    );

    return {arKey: arStrings, enKey: enStrings};
  }

  addString({required String key, String? enValue, String? arValue}) {
    if (enValue != null) enStrings[key] = enValue;
    if (arValue != null) arStrings[key] = arValue;
  }
}
