import 'package:flutter_riverpod/flutter_riverpod.dart';

final languageProvider = StateNotifierProvider<LanguageVM, String>((ref) {
  return LanguageVM("");
});

class LanguageVM extends StateNotifier<String> {
  LanguageVM(String state) : super(state);

  void update({String? locale}) async {
    if (locale != null) state = locale;
  }
}
