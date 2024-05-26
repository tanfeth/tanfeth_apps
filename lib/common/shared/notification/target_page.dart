
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/shared/enum.dart';

void toTarget({required String targetPage, required String targetValue,
  String? userImage , String? title}) {
  switch (targetPage) {
    case NotificationEnum.isOnline:
      // Get.toNamed(userProfileRouting
      //     .config()
      //     .screenFullPath,
      //     parameters: {userProfileRouting().fkAccountKey: targetValue});
      break;
    case NotificationEnum.isOffline:
      // Get.toNamed(userProfileRouting
      //     .config()
      //     .screenFullPath,
      //     parameters: {userProfileRouting().fkAccountKey: targetValue});
      break;
  }
}
