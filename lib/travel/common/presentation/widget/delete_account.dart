import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tanfeth_apps/common/presentation/widget/bottom_sheet/show_bottom_sheet.dart';

import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/vm/langauge/langauge_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/personal_info/widget/delete_account_bottom_sheet_content.dart';



class DeleteAccount extends ConsumerWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context,ref) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {

        showBottomSheetFunction(
          content:const  DeleteAccountBottomSheetContent(),
        );
      },
      child: SizedBox(
        height: 64,
        child: Row(
          children: [
            Expanded(
              child: Text(
                LangEnum.deleteAccount.tr(),
                style: context.text.titleMedium?.copyWith(
                  color: context.color.error
                ),
              ),
            ),

            SvgPicture.asset(
              ref.watch(languageProvider) == 'en'
                  ? Images.arrowSVG
                  : Images.arrowLeftSVG,
              width: 24,
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
