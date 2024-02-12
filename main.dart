import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/controller_api.dart';
import 'controllers/themecontroller.dart';
import 'views/Splash_screen.dart';


void main() async{

  api_controller con=Get.put(api_controller());

 await con.fetch_api();

   if (kDebugMode) {
     print(con.api_key.value);
   }


  runApp(MyApp());
}


class MyApp extends StatelessWidget {
   MyApp({super.key});
  final Themecontroller themecontroller=Themecontroller();
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:themecontroller.theme,
     home: const SplashScreen(),
     // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

