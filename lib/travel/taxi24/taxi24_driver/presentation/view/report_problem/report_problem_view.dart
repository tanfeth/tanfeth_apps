
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tanfeth_apps/common/presentation/widget/appbar.dart';
import 'package:tanfeth_apps/common/presentation/widget/text_form_field_widget.dart';
import 'package:tanfeth_apps/common/shared/extensions/padding_extension.dart';
import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/helper_methods.dart';
import 'package:tanfeth_apps/common/shared/images.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/picker_helper.dart';
import 'package:tanfeth_apps/common/shared/routing/routes/report_problem_route.dart';
import 'package:tanfeth_apps/common/shared/sizes.dart';
import 'package:tanfeth_apps/common/shared/web_width.dart';
import 'package:tanfeth_apps/common/vm/files_vm/files_vm.dart';
import 'package:tanfeth_apps/travel/taxi24/taxi24_driver/presentation/view/auth/verify/widget/back_button_widget.dart';
import 'package:tanfeth_apps/travel/common/shared/form_validation.dart';


class ReportProblemView extends ConsumerStatefulWidget{
  const ReportProblemView();
  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _ReportProblemView();


}

class _ReportProblemView extends ConsumerState<ReportProblemView>{
  
  late String problemTitle ;
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   late FilesVM filesVM;
   late List<File> fileList;
  
  
  @override
  void initState() {
    problemTitle =Get.parameters[ReportProblemRouting.problemTitle] ?? '';
    filesVM = ref.read(filesProvider.notifier);
    filesVM.clearList();

    super.initState();
  }


  initBuild(){
    filesVM = ref.watch(filesProvider.notifier);
    fileList = ref.watch(filesProvider);
  }
  
  @override
  Widget build(BuildContext context) {
    initBuild();

    return Scaffold(
      appBar: MainAppBar(title: LangEnum.reportProblem.tr(),
          leadingWidget: BackButtonWidget()),
      body: WebWidth(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal:24),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 24,
                          ),
                          CustomTextFormField(
                            validator: Validation.notEmpty,
                            maxLine: 8,
                            hintText: LangEnum.describeProblem.tr(),
                            contentPadding: (MySizes.defaultPadding).toAll,
                            keyboardType: TextInputType.multiline,
                            onChanged: (val) {
                            },
                          ),


                          SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            height: 72,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: fileList.length+1,
                              itemBuilder: (BuildContext context, int index) {
                                return (index==0) ? Visibility(
                                  visible:fileList.length<3,
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () async {
                                      List<File> data = await  AppPicker.multipleImages();
                                       filesVM.addToList(data);
                                    },
                                    child: Container(
                                      height: 72,
                                      width: 72,
                                      margin: EdgeInsets.only(right: 16),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(color:context.color.onSurface
                                              .withOpacity(0.3),width: 2),
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child:  SvgPicture.asset(
                                          Images.plusIconSVG),
                                    ),
                                  ),):
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: (){
                                    filesVM.removeFromList(fileList.elementAt(index-1));
                                  },
                                  child: Container(
                                    height: 72,
                                    width: 72,
                                    margin: EdgeInsets.only(right: 16),
                                    alignment: Alignment.topRight,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(image: FileImage(File(fileList[index-1].path)),fit: BoxFit.fill)
                                    ),
                                    child: Container(
                                        height: 24,
                                        width: 24,
                                        margin: EdgeInsets.all(4),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: context.color.surface,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: SvgPicture.asset(
                                          Images.closeSVG,
                                            height: 16, width: 16
                                        ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),

                          Text(
                            LangEnum.upload3Pic.tr(),
                            style: context.text.bodyMedium?.copyWith(
                                color: context.color.onSurface.withOpacity(0.3)
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        closeKeyBoard();
                      }
                    },
                    child: Text(LangEnum.send.tr()),
                  ),

                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}