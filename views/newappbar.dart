
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controllers/controller_api.dart';
import '../controllers/themecontroller.dart';
import 'Help.dart';

class APPBAR extends StatefulWidget implements PreferredSizeWidget
{
  const APPBAR({super.key});

  @override
  State<APPBAR> createState() => _APPBARState();

  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class _APPBARState extends State<APPBAR> {


  bool theme=false;
   Themecontroller themecontroller=Get.put(Themecontroller());
  api_controller con = Get.find<api_controller>();


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return
    Obx(() {
      return Material(
        // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45)),
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.only(left: 3, right: 20),
          // decoration:  BoxDecoration(
          //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45)),
          //   color: Color(0xff8a8f94),
          // ),
          color: const Color(0xff0e0f15),
          alignment: Alignment.center,

          height: 55,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Row(
                children: [
                  // Container(
                  //   padding: EdgeInsets.all(8),
                  //   child: Lottie.asset('assists/Animation - ja.json',fit: BoxFit.cover,
                  //   ),
                  // ),
                  SizedBox(width: 15,),
                  Text("FRIDAY",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      fontFamily: "Widolte_Regular",
                    color: Colors.white
                  ),)

                ],
              ),

              // ),

              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        themecontroller.ToggleTheme();
                        setState(() {
                          if (theme == true) {
                            theme = false;
                          }
                          else {
                            theme = true;
                          }
                        });
                      },
                      child:

                      theme
                          ?
                      Container(
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.brightness_2, color: Colors.white, size: 20,))
                          :
                      Container(
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.brightness_4, color: Colors.white, size: 20,))
                  ),
                  SizedBox(width: size.width / 14,),
                  Visibility(
                    visible: con.api_key.isEmpty ? false : true,
                    child: InkWell(
                        onTap: () {
                          Get.to(() => HELP(questionary: true));
                        },
                        child: Container(
                          // color: Colors.white,
                            padding: const EdgeInsets.all(10),
                            child: const Icon(
                              Icons.live_help_outlined, color: Colors.white,
                              size: 20,))),
                  )
                ],
              ),


            ],
          ),
        ),
      );
    });
  }
}
