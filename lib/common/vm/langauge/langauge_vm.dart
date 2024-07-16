import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tanfeth_apps/common/shared/storage.dart';

final languageProvider = StateNotifierProvider<LanguageVM, String>((ref) {
  return LanguageVM("ar");
});

class LanguageVM extends StateNotifier<String> {
  LanguageVM(super.state){
    update(locale:AppStorage.getLocaleCode() );
  }

  void update({String? locale}) async {
    if (locale != null) state = locale;
  }
}
