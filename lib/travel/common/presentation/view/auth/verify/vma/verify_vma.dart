import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';



// mixin VerifyVMA {
//   CreateForgetPasswordModel createForgetPasswordModel =
//   CreateForgetPasswordModel();
//   CreateVerifyOtpModel createVerifyOtpModel = CreateVerifyOtpModel();
//   CreateVerifyAccountModel createVerifyAccountModel =
//   CreateVerifyAccountModel();
//
//   Future<void> verifyOtp() async {
//     try {
//       showLoading();
//       final model = await verifyOtpApi(model: createVerifyOtpModel);
//       hideLoading();
//       if (model.status == NetworkStatusCodes.oK_200.value) {
//         findAuthVM.createResetPasswordModel.phone =
//             createVerifyOtpModel.phone;
//         findAuthVM.createResetPasswordModel.code =
//             createVerifyOtpModel.code;
//         Get.offNamed(ResetPasswordRouting.config().path);
//       } else {
//         throw model.message ?? '';
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<void> resendCode() async {
//     try {
//       showLoading();
//       final model = await forgetPasswordApi(model: createForgetPasswordModel);
//       hideLoading();
//       if (model.status == NetworkStatusCodes.oK_200.value) {
//         showToast(Lang.codeMassage.tr());
//       } else {
//         throw model.message ?? '';
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<void> verifyAccount() async {
//     try {
//       showLoading();
//       final model = await verifyAccountApi(model: createVerifyAccountModel);
//       hideLoading();
//       if (model.status == NetworkStatusCodes.oK_200.value) {
//         Get.offNamed(
//           SuccessRouting.config().path,
//           parameters: {
//             SuccessRouting.type: flavorConfig.appEnums.successEnum.register
//           },
//         );
//       } else {
//         throw model.message ?? '';
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<void> verifyNewPhone() async {
//     try {
//       showLoading();
//       final model = await verifyNewPhoneApi(model: createVerifyOtpModel);
//       hideLoading();
//       if (model.status == NetworkStatusCodes.oK_200.value) {
//         LogOut();
//       } else {
//         throw model.message ?? '';
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
