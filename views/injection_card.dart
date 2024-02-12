import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../controllers/controller_api.dart';
import 'Help.dart';

class card extends StatefulWidget {
  String stage;
  card({required this.stage, super.key});

  @override
  State<card> createState() => _CardState();
}

class _CardState extends State<card> {
  TextEditingController text_controller = TextEditingController();
  final FlutterSecureStorage secure_storage = const FlutterSecureStorage();
  api_controller apiController = Get.find<api_controller>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Card(
        elevation: 6,
        child: Container(
          padding: (widget.stage == "start")? const EdgeInsets.only(left: 15,right: 15,bottom: 4):const EdgeInsets.only(left: 15,right: 15,top: 15),
          height: widget.stage == "start" ? 360 : 170,
          width: size.width * 0.8,
          child: Column(
            children: [
              (widget.stage == "start")?
              Expanded(child: Container(
                  child: Lottie.asset("assists/api_card.json",repeat: true,fit: BoxFit.contain))):Container(),
              TextFormField(
                controller: text_controller,
                obscureText: true,
                maxLength: 50,
                minLines: 1,
                //  keyboardType: TextInputType.multiline,
                //   keyboardType: TextInputType.,
                //   maxLines: null,
                style: const TextStyle(
                  fontSize: 13,
                ),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Enter your API key"),
              ),

              ElevatedButton(
                onPressed: () async {

                  apiController.update_api(text_controller.text);
                   await secure_storage.write(key: "api_key", value: text_controller.text);
                  apiController.fetch_api();

                  if (widget.stage != "start") {
                    // Get.to(()=>const SplashScreen());
                    Get.back();

                  }
                  else
                    {
                 // Get.to(()=>const SplashScreen());
                }
                },
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFF1E1E25)),
                    elevation: MaterialStatePropertyAll(5),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))))),
                child: const Text(
                  "Enter API",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // const Spacer(),

              (widget.stage == "start")
                  ? Container(
                      padding: const EdgeInsets.only(bottom: 3),
                      width: size.width,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "NewUser?",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => HELP(
                                    questionary: false,
                                  ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                " Get KEY ",
                                style: TextStyle(
                                  color: Color(0xC84444BE),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(),
              // Text
              // ButtonBar(
              //
              // )
            ],
          ),
        ),
      ),
    );
  }
}
