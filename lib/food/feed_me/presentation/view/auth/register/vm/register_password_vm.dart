


import 'package:flutter_riverpod/flutter_riverpod.dart';


var feedMeRegisterPassProvider = StateNotifierProvider<FeedMeRegisterPassVM, bool>((ref) {
  return FeedMeRegisterPassVM();
});

var feedMeRegisterConfirmPassProvider =
StateNotifierProvider<FeedMeRegisterPassVM, bool>((ref) {
  return FeedMeRegisterPassVM();
});


class FeedMeRegisterPassVM extends StateNotifier<bool>{
  FeedMeRegisterPassVM() : super(true);

  void  obscureTextToggle(){
    state = !state;
  }


}