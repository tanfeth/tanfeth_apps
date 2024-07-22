


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/travel/common/presentation/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/routes/attachment_info_route.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/data/model/AttachmentInfoModel.dart';


class AttachmentInfoView extends ConsumerStatefulWidget{
  const AttachmentInfoView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AttachmentInfoView();
}

class _AttachmentInfoView extends ConsumerState<AttachmentInfoView>{


  late AttachmentInfoModel attachmentInfoModel;

  @override
  void initState() {
    if(Get.arguments != null){
      attachmentInfoModel = Get.arguments[AttachmentInfoRouting.attachmentInfoModel]??
          AttachmentInfoModel();
    }
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        leadingWidget:  BackButtonWidget(),
      ),
      body: WebWidth(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          10.ph,

                          Text(
                            attachmentInfoModel.title??'',
                            style: context.text.titleMedium,
                          ),
                          20.ph,

                          Text(
                            attachmentInfoModel.subTitle??'',
                            style: TextStyle(
                              color: context.color.surfaceContainerHighest
                            ),
                          ),

                          25.ph,

                          Text(
                           LangEnum.makeSureTo.tr(),
                            style: context.text.titleMedium,
                          ),

                          20.ph,

                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => const  SizedBox(height: 10,),
                            itemCount: (attachmentInfoModel.infoList??[]).length,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      Images.checkMarkSVG,
                                      height: 15,
                                      width: 15,
                                      colorFilter:ColorFilter.mode(
                                          context.color.primary,
                                          BlendMode.srcIn),
                                    ),

                                    20.pw,

                                    Expanded(
                                      child: Text(
                                          (attachmentInfoModel.infoList??[])[index],
                                        style: TextStyle(
                                          color: context.color.surfaceContainerHighest
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          )

                        ],
                      ),
                    )
                ),

                ElevatedButton(
                  onPressed: attachmentInfoModel.takePhotoFun??(){},
                  child: Text(LangEnum.takePhoto.tr()),
                ),

              ],
            ),
          ),
        ),
      )
    );
  }

}