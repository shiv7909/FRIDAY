


  import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Launchers extends GetxController {

  void email_launch() async {
    final Uri emailLaunchUri = Uri(
      scheme: "mailto",
      path: "shiva547337@gmail.com",
    );
    await launchUrl(emailLaunchUri);
  }

  void site_launch(String string) async {
    final String Websiteurl = string;
    launchUrlString(Websiteurl);
  }

}