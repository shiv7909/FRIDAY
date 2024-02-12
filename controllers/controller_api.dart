

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';


class api_controller extends GetxController {
  FlutterSecureStorage secure_storage = const FlutterSecureStorage();


  RxString api_key = ''.obs;
  RxString our_url1 = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key='.obs;
  RxString our_url2 = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro-vision:generateContent?key='.obs;

  @override
  void onInit() {
    super.onInit();
    fetch_api();
  }

  Future<void> fetch_api() async {
    String? storedApiKey = await secure_storage.read(key: "api_key");
    api_key.value = storedApiKey ?? '';
      updateOurUrl();
  }

  void update_api(String newApiKey) async{
    api_key.value = newApiKey;
    await secure_storage.write(key: "api_key", value: newApiKey);
    updateOurUrl();
  }

  Future<void> remove_api() async {
    await secure_storage.delete(key: "api_key");
    api_key.value = "";
    updateOurUrl();
  }
  //
  void updateOurUrl() {
    our_url1.value = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${api_key.value}';
   our_url2.value = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro-vision:generateContent?key=${api_key.value}';
  }
}
