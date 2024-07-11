import 'package:url_launcher/url_launcher.dart';

class StartCooking {
  Future<void> startCooking(String url) async {
    final recipee = Uri.parse(url);
    if (!await launchUrl(recipee)) {
      throw Exception('Could not launch');
    }
  }
}
