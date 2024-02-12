

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Themecontroller extends GetxController{

  RxBool isDarkMode=false.obs;
  ThemeData get theme=> isDarkMode.value? ThemeData.dark():ThemeData.light();

  void ToggleTheme(){
    isDarkMode.toggle();
    Get.changeTheme(theme);
  }
}