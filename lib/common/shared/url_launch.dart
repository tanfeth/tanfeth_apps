import 'package:url_launcher/url_launcher.dart';

class DinnovaLaunch {
  static void whatsApp(String phone) async =>
      _launch("whatsapp://send?phone=$phone");

  static void phone(String phone) async => _launch("tel:$phone");

  static void sms(String phone) async => _launch("sms:$phone");

  static void file(String path) async => _launch("file:$path");

  static void url(String url) async => _launch(url);

  static void email(String email) async => _launch("mailto:$email");

  static _launch(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  static map(double lat, double lng) {
    String uri = "http://maps.google.com/maps?daddr=$lat,$lng";
    _launch(uri);
  }
}
