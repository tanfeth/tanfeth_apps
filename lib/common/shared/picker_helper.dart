import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jhijri_picker/_src/_jWidgets.dart';
import 'package:jhijri/jHijri.dart';
import "dart:ui" as ui;

import 'package:tanfeth_apps/common/shared/extensions/theme_extensions.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';


class AppPicker {
  static Future<File?> capture() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
    return image != null ? File(image.path) : null;
  }

  static Future<File?> image(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? img = await imagePicker.pickImage(source: source);
    return img != null ? File(img.path) : null;
  }

  static Future<List<File>> multipleImages() async {
    final ImagePicker imagePicker = ImagePicker();
    List<File> list = [];
    final List<XFile> imagesPicker = await imagePicker.pickMultiImage();
    if (imagesPicker.isNotEmpty) {
      for (var element in imagesPicker) {
        list.add(File(element.path));
      }
    }
    return list;
  }

  static Future<PlatformFile?> file() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    return result?.files.single;
  }

  static Future<List<PlatformFile>> multipleFiles() async {
    List<PlatformFile> list = [];
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      list.addAll(result.files);
    }
    return list;
  }

  static Future<TimeOfDay?> time({required BuildContext context}) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dialOnly,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    return time;
  }

  static Future<DateTime?> date({
    bool? oldDatesOnly,
    bool? newDatesOnly,
    required BuildContext context,
  }) async {
    late DateTime? pickDate;
    if (oldDatesOnly == true) {
      pickDate = await showDatePicker(
        context: context,
        firstDate: DateTime(1950),
        initialDate: DateTime.now(),
        lastDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
      );
    } else if (newDatesOnly == true) {
      pickDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 10),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
      );
    } else {
      pickDate = await showDatePicker(
        context: context,
        firstDate: DateTime(1950),
        initialDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 10),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
      );
    }
    return pickDate;
  }




  static  Future<JPickerValue?> selectHijriDate(BuildContext context,
      TextEditingController hijri)async{
    return await showGlobalDatePicker(
      context: context,
      selectedDate: JDateModel(jhijri: JHijri.now()),
      startDate: JDateModel(jhijri: JHijri(fDay: 1, fMonth: 1, fYear: 1385)),
      endDate: JDateModel(jhijri: JHijri(fDay: 1, fMonth: 1, fYear: 1500)),
      pickerMode: DatePickerMode.day,
      pickerTheme: Theme.of(context).copyWith(
        useMaterial3: true,
        colorScheme:  ColorScheme.light(
          primary: context.color.primary,
          onPrimary:context.color.onSurface,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: context.color.primary,
          ),
        ),
      ),
      textDirection: ui.TextDirection.rtl,
      locale: const Locale("ar", "SA"),
      okButtonText: LangEnum.save.tr(),
      cancelButtonText:LangEnum.close.tr(),
      onOk: (value) {
        Get.back();
      },
      onChange: (value){
        String jhijriM="";
        String jhijriD="";
        if(value.jhijri.month.toString().length!=2){
          jhijriM ='0${value.jhijri.month}';
        }else{
          jhijriM='${value.jhijri.month}';
        }
        if(value.jhijri.day.toString().length!=2){
          jhijriD='0${value.jhijri.day}';
        }else{
          jhijriD='${value.jhijri.day}';
        }
        hijri.text="${value.jhijri.year}/$jhijriM/$jhijriD";
        return value;
      },
      onCancel: () {
       Get.back();
      },
      primaryColor: context.color.primary,
      calendarTextColor: context.color.onSurface,
      backgroundColor: context.color.surface,
      borderRadius: Radius.circular(16),
      buttonTextColor: context.color.onSurface,
      headerTitle:  Container(
        width: 200,
        height: 40,
        padding: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
            color:context.color.onSurface ,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16),
                topRight: Radius.circular(16))
        ),
        child: Center(
          child: Text(
            LangEnum.hijriDate.tr(),
            style: TextStyle(
              color: context.color.primary
            ),
          )
        ),
      ),
    );
  }



}
