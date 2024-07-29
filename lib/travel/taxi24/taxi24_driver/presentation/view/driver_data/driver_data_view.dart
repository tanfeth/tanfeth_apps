
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:api_controller/presentation/widget/bottom_sheet/show_bottom_sheet.dart';
import 'package:tanfeth_apps/common/shared/extensions/button_extensions.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:api_controller/shared/web_width.dart';
import 'package:tanfeth_apps/flavor/init_binding.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/log_out_bottom_sheet_content.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/attachment_info_route.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/car_detalis_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/AttachmentInfoModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/driver/ResponseDriverStatusModel.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/driver_data/vm/driver_data_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/driver_data/widget/driver_data_widget.dart';




class DriverDataView extends ConsumerStatefulWidget{
  const DriverDataView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_DriverDataView();

}

class _DriverDataView extends ConsumerState<DriverDataView>{

  DateTime backPressDateTime = DateTime.now();
  late TaxiDriverDataVM taxiDriverDataVM;
   ResponseDriverStatusModel? driverStatusModel;
  late  AttachmentInfoModel attachmentInfoModel ;

  @override
  void initState() {
    taxiDriverDataVM = ref.read(taxiDriverDataProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      taxiDriverDataVM.getAccountStatus();
    });

    super.initState();
  }

  initBuild(){
    taxiDriverDataVM = ref.watch(taxiDriverDataProvider.notifier);
     driverStatusModel = ref.watch(taxiDriverDataProvider);
  }


  @override
  Widget build(BuildContext context) {
    initBuild();

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        final timeGap = DateTime.now().difference(backPressDateTime);
        final cantExit = timeGap >= const Duration(seconds: 2);
        backPressDateTime = DateTime.now();
        if (cantExit) {
          showToast(LangEnum.pressAgainToExit.tr(),
              position: ToastPosition.bottom);
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        appBar: const MainAppBar(
         // trailingWidget:HelpWidget(),
        ),
        body: WebWidth(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child:  FutureBuilder(
                future: ref.watch(taxiDriverDataVM.futureProvider),
                builder: (context,snapshot){
                  var isLoading = snapshot.connectionState ==
                      ConnectionState.waiting;
                  if(isLoading){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }else{
                    return  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Padding(
                                //   padding:  const EdgeInsets.symmetric(vertical: 8,),
                                //   child: Text(
                                //     "${LangEnum.welcome.tr()} ${'Abdelrhman'}",
                                //     style: context.text.titleMedium,
                                //     textAlign: TextAlign.start,
                                //   )
                                // ),
                            
                                10.ph,
                                Text(
                                  LangEnum.completeStepsFinishEnrollment.tr(),
                                  textAlign: TextAlign.start,
                                  style: context.text.bodyLarge,
                                ),
                                const SizedBox(height: 20,),
                            
                                /// Personal photo
                                DriverDataWidget(
                                  image: Images.personSVG,
                                  title: LangEnum.personalPhoto.tr(),
                                  state: driverStatusModel?.profileImageState,
                                  stateNote: driverStatusModel?.profileImageStateNote,
                                  function: () {
                                    attachmentInfoModel = AttachmentInfoModel();
                            
                                    attachmentInfoModel.title=
                                    LangEnum.takePhotoYourself.tr();
                            
                                    attachmentInfoModel.subTitle=
                                        LangEnum.needPhotoVerifyYou.tr();
                            
                                    attachmentInfoModel.driverDataEnum =
                                    customAppFlavor.commonEnum.driverDataEnum
                                    .personalPic;
                            
                                    attachmentInfoModel.infoList = [
                                      LangEnum.faceCameraDirectlyWithEyes.tr(),
                                      LangEnum.photoTakenGoodLight.tr(),
                                      LangEnum.photoFocusFreeGlare.tr()
                                    ];
                            
                                    Get.toNamed(AttachmentInfoRouting.config().path,
                                    arguments: {
                                      AttachmentInfoRouting.attachmentInfoModel:
                                      attachmentInfoModel
                                    });
                                  },
                                ),
                            
                                ///Saudi ID
                                DriverDataWidget(
                                  image: Images.fileSVG,
                                  title: LangEnum.saudiID.tr(),
                                  state:  driverStatusModel?.saudiIdImageState,
                                  stateNote: driverStatusModel?.saudiIdImageStateNote,
                                  function: () {
                                    attachmentInfoModel = AttachmentInfoModel();
                            
                                    attachmentInfoModel.title=
                                        LangEnum.uploadphotoSaudiID.tr();
                            
                                    attachmentInfoModel.subTitle= '';
                            
                                    attachmentInfoModel.driverDataEnum =
                                        customAppFlavor.commonEnum.driverDataEnum
                                            .saudiID;
                            
                                    attachmentInfoModel.infoList = [
                                      LangEnum.sureIDValidNotExpired.tr(),
                                      LangEnum.photoNotBlurryInformationReadable.tr(),
                                      LangEnum.saudiCitizenChildAgeNot20Years.tr()
                                    ];

                            
                                    Get.toNamed(AttachmentInfoRouting.config().path,
                                        arguments: {
                                          AttachmentInfoRouting.attachmentInfoModel:
                                          attachmentInfoModel
                                        });
                                  },),
                            
                                /// Driving licence
                                DriverDataWidget(
                                  image: Images.fileSVG,
                                  title: LangEnum.drivingLicence.tr(),
                                  state: driverStatusModel?.licenseImageState,
                                  stateNote: driverStatusModel?.licenseImageStateNote,
                                  function: () {
                                    attachmentInfoModel = AttachmentInfoModel();
                            
                                    attachmentInfoModel.title=
                                        LangEnum.uploadPhotoDrivingLicense.tr();
                            
                                    attachmentInfoModel.subTitle= '';
                            
                                    attachmentInfoModel.driverDataEnum =
                                        customAppFlavor.commonEnum.driverDataEnum
                                            .drivingLicence;
                            
                                    attachmentInfoModel.infoList = [
                                      LangEnum.photoTakenGoodLight.tr(),
                                      LangEnum.photoNotBlurryInformationReadable.tr(),
                                    ];
                            
                                    Get.toNamed(AttachmentInfoRouting.config().path,
                                        arguments: {
                                          AttachmentInfoRouting.attachmentInfoModel:
                                          attachmentInfoModel
                                        });
                                  },),
                            
                                /// Car details
                                DriverDataWidget(
                                  image: Images.driverCarSVG,
                                  title: LangEnum.carDetails.tr(),
                                  state: driverStatusModel?.carDetailsState,
                                  stateNote: '',
                                  function: () {
                                    Get.toNamed(CarDetailsRouting.config().path);
                                  },),
                            
                                ///Vehicle registration
                                DriverDataWidget(
                                    image: Images.fileSVG,
                                    state:  driverStatusModel?.carRegistrationState,
                                   stateNote: driverStatusModel?.carRegistrationStateNote,
                                    title: LangEnum.vehicleRegistration.tr(),
                                    function: () {
                                      attachmentInfoModel = AttachmentInfoModel();
                            
                                      attachmentInfoModel.title=
                                          LangEnum.uploadphotoVehicleRegistrationIstimara.tr();
                            
                                      attachmentInfoModel.subTitle= '';
                                      attachmentInfoModel.driverDataEnum =
                                          customAppFlavor.commonEnum.driverDataEnum
                                              .vehicleRegistration;
                            
                                      attachmentInfoModel.infoList = [
                                        LangEnum.photoTakenGoodLight.tr(),
                                        LangEnum.photoNotBlurryInformationReadable.tr(),
                                        LangEnum.registerVehicleOwnerVehicle.tr(),
                                        LangEnum.acceptAnyDocumenType.tr()
                                      ];
                            
                                      Get.toNamed(AttachmentInfoRouting.config().path,
                                          arguments: {
                                            AttachmentInfoRouting.attachmentInfoModel:
                                            attachmentInfoModel
                                          });
                                    }),
                            
                                /// Vehicle insurance
                                DriverDataWidget(
                                    image: Images.fileSVG,
                                    state: driverStatusModel?.carInssuranceState,
                                    stateNote: driverStatusModel?.carInssuranceStateNote,
                                    title: LangEnum.vehicleInsurance.tr(),
                                    function: () {
                                      attachmentInfoModel = AttachmentInfoModel();
                            
                                      attachmentInfoModel.title=
                                          LangEnum.uploadPhotoVehicleInsurance.tr();
                            
                                      attachmentInfoModel.subTitle= '';
                                      attachmentInfoModel.driverDataEnum =
                                          customAppFlavor.commonEnum.driverDataEnum
                                              .vehicleInsurance;
                            
                                      attachmentInfoModel.infoList = [
                                        LangEnum.photoTakenGoodLight.tr(),
                                        LangEnum.photoNotBlurryInformationReadable.tr(),
                                        LangEnum.acceptAnyDocumenType.tr(),
                                      ];
                            
                                      Get.toNamed(AttachmentInfoRouting.config().path,
                                          arguments: {
                                            AttachmentInfoRouting.attachmentInfoModel:
                                            attachmentInfoModel
                                          });
                            
                                    }),
                              ],
                            ),
                          ),
                        ),


                        Container(
                          width: double.infinity,
                          height: 48,
                          margin:const  EdgeInsets.symmetric(horizontal: 15),
                          child: ElevatedButton(
                            style: const ButtonStyle().MinErrorElevatedButton(context),
                            onPressed: () {
                              showBottomSheetFunction(
                                content: const LogOutBottomSheetContent(),
                              );
                            },
                            child: Text(LangEnum.logout.tr()),
                          ),
                        ),
                        20.ph
                      ],
                    );
                  }
                },
              ),


            ),
          ),
        ),
      ),
    );
  }

}