import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
}
