
import 'package:tanfeth_apps/common/shared/languages.dart';

class Taxi24DriverLanguages extends MyLanguages {
  @override
  Map<String, Map<String, String>> get keys {
    super.keys;

    addString(key: LangEnum.info.name, enValue: "info", arValue: "معلومات");
    addString(key: LangEnum.add.name, enValue: "add more", arValue: "اضافة");

    addString(
        key: LangEnum.yourName.name, enValue: 'Your Name', arValue: 'اسمك');
    return {MyLanguages.arKey: enStrings, MyLanguages.enKey: arStrings};
  }
}
