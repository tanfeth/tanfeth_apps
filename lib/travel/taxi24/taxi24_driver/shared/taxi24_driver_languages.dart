
import 'package:tanfeth_apps/common/shared/languages.dart';

class Taxi24DriverLanguages extends MyLanguages {
  @override
  Map<String, Map<String, String>> get keys {
    super.keys;

    addString(key: LangEnum.info.name, enValue: "info", arValue: "معلومات");
    addString(key: LangEnum.add.name, enValue: "add more", arValue: "اضافة");
    addString(
      key: LangEnum.start.name,
      enValue: 'start now',
      arValue: 'ابدأ الآن',
    );


    addString(
      key: LangEnum.onboardTitle1.name,
      enValue: 'Become a delegate with taxi24',
      arValue: 'كن مندوبًا مع  تاكسى24',
    );
    addString(
      key: LangEnum.onboardTitle2.name,
      enValue: 'Easier user experience.',
      arValue: 'تجربة المستخدم الأسهل',
    );
    addString(
      key: LangEnum.onboardTitle3.name,
      enValue: 'Incentive commissions.',
      arValue: 'عمولات محفزة',
    );
    addString(
      key: LangEnum.onboardDes1.name,
      arValue: 'مزايا رائعة وعمولات اضافية عندما تصبح مندوبًا مع  تاكسى24.',
      enValue:
      "Great benefits and additional commissions when you become a representative with taxi24",
    );
    addString(
      key: LangEnum.onboardDes3.name,
      enValue:
      'Get additional incentive commissions when you complete more orders',
      arValue: 'احصل على عمولات إضافية محفزة عند انجازك المزيد من الطلبات',
    );
    addString(
      key: LangEnum.onboardDes2.name,
      enValue:
      'You can manage your orders and know your business statistics in detail and with ease',
      arValue: 'يمكنك إدارة طلباتك ومعرفة احصائيات عملك بالتفصيل وبكل سهولة',
    );

    addString(
      key: LangEnum.welcomeTitle.name,
      enValue: 'Welcome to Taxi 24/7 Driver',
      arValue: 'مرحبا بكم في سائق تاكسى 24/7',
    );


    addString(
      key: LangEnum.welcomeDes.name,
      enValue: 'Work at any time you want and make as much money as you want',
      arValue: 'اعمل في أي وقت تريده واكسب المال الذي تريده',
    );

    addString(
        key: LangEnum.yourName.name, enValue: 'Your Name', arValue: 'اسمك');


    return {MyLanguages.arKey: arStrings, MyLanguages.enKey: enStrings};
  }
}
