

import 'package:tanfeth_apps/common/shared/languages.dart';

abstract class Validation {
  static String? phone(String? value) {
    if (value!.isEmpty) {
      return LangEnum.validatePhoneEmpty.tr();
    } else if (!value.startsWith(5.toString())) {
      return LangEnum.validatePhoneStartValidator.tr();
    } else if (value.length != 9) {
      return LangEnum.validatePhoneValidator.tr();
    }
    return null;
  }

  static String? password(String? value) {
    RegExp regExp = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
    if (value!.isEmpty) {
      return LangEnum.validatePassEmpty.tr();
    } else if (!regExp.hasMatch(value)) {
      return LangEnum.validatePassRegExp.tr();
    } else if (value.length < 8) {
      return LangEnum.validatePasswordLength.tr();
    }
    return null;
  }

  static String? confirmPass({required String val1, required String val2}) {
    if (val1 != val2) {
      return LangEnum.validatePasswordNotMatch.tr();
    }
    return null;
  }

  static String? notEmpty(String? value) {
    if ((value ?? '').isEmpty) {
      return LangEnum.validateFieldRequired.tr();
    }
    return null;
  }

  static String? email(String? value) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return LangEnum.validateEmail.tr();
    } else {
      return null;
    }
  }
}
