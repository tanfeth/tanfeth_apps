
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
      enValue: 'Join us and enjoy total freedom and control over your time and earnings.',
      arValue: 'انضم إلينا واستمتع بالحرية الكاملة والتحكم في وقتك وأرباحك.',
    );

    addString(
        key: LangEnum.enterMobileNum.name,
        enValue: 'Enter your mobile number',
        arValue: 'أدخل رقم هاتفك المحمول');


    addString(
        key: LangEnum.enterMobileNumDes.name,
        enValue: 'We’ll text you a code to verify your number',
        arValue: 'سنرسل إليك رمزًا للتحقق من رقمك');

    addString(
      key: LangEnum.numPhone.name,
      enValue: 'Mobile number',
      arValue: 'رقم الجوال',
    );


    addString(
      key: LangEnum.continueWord.name,
      enValue: 'Continue',
      arValue: 'استمر',
    );

    addString(
      key: LangEnum.send.name,
      enValue: 'Send',
      arValue: 'ارسال',
    );
    addString(
      key: LangEnum.enterCode.name,
      enValue: 'Enter the activation code',
      arValue: 'ادخل كود التفعيل',
    );
    addString(
      key: LangEnum.codeDesReset.name,
      enValue:
      'Enter the verification code sent to your mobile number to be able to complete the password reset process',
      arValue: 'قم بإدخال كود التحقق المرسل على رقم جوالك لتتمكن من إستكمال عملية إعادة تعيين كلمة المرور',
    );
    addString(
      key: LangEnum.sure.name,
      enValue: 'sure',
      arValue: 'تأكيد',
    );


    addString(
      key: LangEnum.codeDesRegister.name,
      enValue: 'Enter the verification code sent to your mobile number to be able to complete  process',
      arValue: 'قم بإدخال كود التحقق المرسل على رقم جوالك لتتمكن من إستكمال العملية ',
    );


    addString(
      key: LangEnum.resendCodeDesc.name,
      enValue: 'Didn\'t you receive the message?',
      arValue: 'لم تصلك الرسالة؟',
    );
    addString(
      key: LangEnum.resendCodeBtn.name,
      enValue: 'Resend code',
      arValue: ' إعادة الإرسال',
    );
    
    
    return {MyLanguages.arKey: arStrings, MyLanguages.enKey: enStrings};
  }
}
