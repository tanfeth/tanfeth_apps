import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:api_controller/shared/extensions/padding_extension.dart';
import 'package:api_controller/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/driver_data/widget/help_widget.dart';


class AccountStatusView extends StatelessWidget {
  final String ? status;
  const AccountStatusView({super.key, this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const MainAppBar(trailingWidget:HelpWidget()),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(status == "accept"? Images.successSVG : Images.rejectSVG,width: 90,height: 90,),
            24.ph,
            Center(child: Text(status == "accept"?LangEnum.pendingTitle.tr():LangEnum.rejectTitle.tr(),style: context.text.headlineSmall)),
            8.ph,
            Center(child: Text(status == "accept"?LangEnum.pendingMassage.tr():LangEnum.rejectMassage.tr(),style: context.text.bodyMedium))
          ],
        ),
      ),
    );
  }
}
