
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/document_details_route.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/verify/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/document/widget/document_cell.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/widget/small_divider.dart';

class DocumentView extends ConsumerStatefulWidget{
  const DocumentView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _DocumentView();
  
}

class _DocumentView extends ConsumerState<DocumentView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
          title: LangEnum.document.tr(),
          leadingWidget: BackButtonWidget(),
        ),
        body: WebWidth(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: 28,),
                DocumentCell(
                  image: Images.fileSVG,
                  title: LangEnum.saudiID.tr(),
                  function: () {
                    Get.toNamed(DocumentDetailsRouting.config().path,
                    parameters: {
                      DocumentDetailsRouting.pageTitle:
                      LangEnum.saudiID.tr(),
                      DocumentDetailsRouting.image:
                      'https://picsum.photos/id/1/200/300',
                    });
                  },
                  isDocument: true,
                  expireDate: DateFormat("MMMM dd, yyyy").format(DateTime.parse("${DateTime.now()}")),
                ),

                SmallDivider(),
                SizedBox(height: 10,),
                DocumentCell(
                  image: Images.fileSVG,
                  title:  LangEnum.drivingLicense.tr(),
                  function: () {
                    Get.toNamed(DocumentDetailsRouting.config().path,
                        parameters: {
                          DocumentDetailsRouting.pageTitle:
                          LangEnum.drivingLicense.tr(),
                          DocumentDetailsRouting.image:
                          'https://picsum.photos/id/1/200/300',
                        });
                  },
                  isDocument: true,
                  expireDate: DateFormat("MMMM dd, yyyy").format(DateTime.parse("${DateTime.now()}")),
                ),
              ],
            ),
          )
        )
        );
  }
  
}