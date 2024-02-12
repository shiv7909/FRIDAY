import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../controllers/controller_api.dart';
import '../controllers/launchers.dart';
import 'Splash_screen.dart';
import 'alert_developer_info.dart';
import 'alert_remove.dart';
import 'fullimage.dart';
import 'injection_card.dart';

class HELP extends StatefulWidget {
  bool questionary;
  HELP({required this.questionary, super.key});

  @override
  State<HELP> createState() => _HELPState();
}

class _HELPState extends State<HELP> {


  RxInt selected_dec = 0.obs;

  api_controller con = Get.find<api_controller>();
  Launchers lanchers=Get.put(Launchers());




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          actions: [
            GestureDetector(
                onTap: () {


                   showDialog(
                      context: context,
                      builder: (context)=> const My_info(),
                      );

                },
                child: const Icon(Icons.support_agent)

            ),
            const SizedBox(
              width: 14,
            )
          ],
          centerTitle: true,
          title: const Text(
            "Support",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.questionary == true
                            ? Container(
                                padding:
                                    const EdgeInsets.only(bottom: 10, left: 10),
                                child: const Text(
                                  "Re-enter your api key :",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    //   fontFamily: "Widolte_Regular"
                                  ),
                                ),
                              )
                            : Container(),
                        widget.questionary == true
                            ? Center(child: card(stage: "second"))
                            : const SizedBox(),
                        widget.questionary == true
                            ? Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, left: 10, top: 20),
                                    child: const Text(
                                      "Note: when you re-enter your API key old API key will be automatically removed",
                                      style: TextStyle(
                                          fontSize: 12,
                                          // color: Colors.black,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.07,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(top: 10,
                                            bottom: 10, left: 10),
                                        child: const Text(
                                          "frequently asked questions : ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            // fontFamily: "Widolte_Regular"
                                          ),
                                        ),
                                      ),
                                      SizedBox(

                                          width: 70,
                                          height: 70,
                                          child: Lottie.asset("assists/faq1.json"))
                                    ],
                                  )
                                ],
                              )
                            : const SizedBox(),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: size.width,
                          alignment: widget.questionary == true
                              ? Alignment.centerLeft
                              : Alignment.centerLeft,
                          // color: widget.questionary == true
                          //     ? Colors.white
                          //     : Colors.white,
                          // color: Colors.white,
                          // child: const Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selected_dec.value != 1) {
                                  selected_dec = 1.obs;
                                } else {
                                  selected_dec = 0.obs;
                                }
                                if (kDebugMode) {
                                  print(selected_dec.value);
                                }
                              });
                            },
                            child: widget.questionary == true
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        " 🛡️  ",
                                      ),
                                      Expanded(
                                        child: Text(
                                          "how can i obtain an APi key through step-by-step process?",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: selected_dec.value == 1
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                          // textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  )
                                : const Text(
                                    "📜 Get Your Google API Key: A Quick guide",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                        color: Colors.blue
                                      ),
                                  ),
                          ),
                          // ),
                        ),
                        Obx(() {
                          if (selected_dec.value == 1) {
                            return Column(children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "step 1:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xAE5BB253),
                                      fontFamily: "RobotoCondensed",
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Text("Go to"),
                                  GestureDetector(
                                      onTap: () {
                                        lanchers.site_launch(
                                            "https://ai.google.dev/?gad_source=1");
                                      },
                                      child: const Text(
                                        " AI.Google.Dev ",
                                        style: TextStyle(color: Colors.blue),
                                      )),
                                  const Expanded(
                                      child: Text("in your web browser.")),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                      () => FullImage(image: 'assists/g1.jpg'));
                                },
                                child: Container(
                                  height: size.height * 0.35,
                                  decoration: const BoxDecoration(
                                    // borderRadius: BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage("assists/g1.jpg"),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "step 2:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xAE5BB253),
                                      fontFamily: "RobotoCondensed",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                      child: Text(
                                          'Look for a button or link that says "Get API Key in Google AI Studio" and click on it.')),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                      () => FullImage(image: 'assists/g2.png'));
                                },
                                child: Container(
                                  height: size.height * 0.35,
                                  decoration: const BoxDecoration(
                                    // borderRadius: BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage("assists/g2.png"),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "step 3:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xAE5BB253),
                                      fontFamily: "RobotoCondensed",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                      child: Text(
                                          "A new screen appears and If you're on your phone, make sure your browser is in desktop mode.")),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() =>
                                          FullImage(image: 'assists/g3.png'));
                                    },
                                    child: Container(
                                      height: size.height * 0.35,
                                      width: size.width / 2 - 10,
                                      decoration: const BoxDecoration(
                                        // borderRadius: BorderRadius.all(Radius.circular(20)),
                                        image: DecorationImage(
                                          image: AssetImage("assists/g3.png"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() =>
                                          FullImage(image: 'assists/g4.png'));
                                    },
                                    child: Container(
                                      height: size.height * 0.35,
                                      width: size.width / 2 - 10,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assists/g4.png"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "step 4:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xAE5BB253),
                                      fontFamily: "RobotoCondensed",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                      child: Text(
                                          'Look for something that says "Get API Key" or a key symbol. Click on it.')),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() =>
                                      FullImage(image: 'assists/g5f.png'));
                                },
                                child: Container(
                                  height: size.height * 0.35,
                                  decoration: const BoxDecoration(
                                    // borderRadius: BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage("assists/g5f.png"),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "step 5:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xAE5BB253),
                                      fontFamily: "RobotoCondensed",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                      child: Text(
                                          'Find an option like "Create API Key in New Project" and click. Wait a bit, and your API key will appear. ')),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                      () => FullImage(image: 'assists/g6.png'));
                                },
                                child: Container(
                                  height: size.height * 0.35,
                                  decoration: const BoxDecoration(
                                    // borderRadius: BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage("assists/g6.png"),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "step 6:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xAE5BB253),
                                      fontFamily: "RobotoCondensed",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                      child: Text(
                                          'Wohoo 🎉   now copy the key and paste it into JARVIS')),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ]);
                          } else {
                            return Container();
                          }
                        }),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: size.width,
                          alignment: widget.questionary == true
                              ? Alignment.centerLeft
                              : Alignment.centerLeft,
                        // child: const Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selected_dec.value != 2) {
                                  selected_dec = 2.obs;
                                } else {
                                  selected_dec = 0.obs;
                                }
                                if (kDebugMode) {
                                  print(selected_dec.value);
                                }
                              });
                            },
                            child: widget.questionary == true
                                ? Row(
                                    children: [
                                      const Text(
                                        " 🛡️  ",
                                      ),
                                      Expanded(
                                        child: Text(
                                          "how to get the APi key (video tutorial) ?",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: selected_dec.value == 2
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : const Text(
                                    "📱 Get Your Google API Key: video tutorial",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                        color: Colors.blue
                                    ),
                                  ),
                          ),
                          // ),
                        ),
                        Obx(
                          () {
                            if (selected_dec.value == 2) {
                              return Column(
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Video link",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xAE5BB253),
                                          fontFamily: "RobotoCondensed",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          lanchers.site_launch(
                                              "https://youtu.be/6aj5a7qGcb4?feature=shared");
                                        },
                                        child: const Text(
                                          'click here for video',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      )
                                    ],
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: size.width,
                          alignment: widget.questionary == true
                              ? Alignment.centerLeft
                              : Alignment.centerLeft,
                          // color: widget.questionary == true
                          //     ? Colors.white
                          //     : Colors.lightBlueAccent.shade100,

                          // child: const Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selected_dec.value != 3) {
                                  selected_dec = 3.obs;
                                } else {
                                  selected_dec = 0.obs;
                                }
                                if (kDebugMode) {
                                  print(selected_dec.value);
                                }
                              });
                            },
                            child: widget.questionary == true
                                ? Row(
                                    children: [
                                      const Text(
                                        " 🛡️  ",
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Is my Api key secured ?",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: selected_dec.value == 3
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : const Text(
                                    "🔒 is my APi key secured",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue
                                    ),
                                  ),
                          ),
                          // ),
                        ),
                        Obx(() {
                          if (selected_dec.value == 3) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("▪️  "),
                                        Expanded(
                                          child: Text(
                                            "Your API key is not stored on external servers, ensuring that sensitive information remains exclusively on the user's mobile device.",
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                    padding: const EdgeInsets.only(left: 10, top: 10),
                                    child: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("▪️  "),
                                        Expanded(
                                          child: Text(
                                            "Powered by Flutter Secure Storage. Your API key is safeguarded using industry-standard encryption. Keychain on iOS and KeyStore on Android ensure top-notch security",
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        }),


                        widget.questionary == true
                            ? Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                width: size.width,
                                alignment:Alignment.centerLeft,
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (selected_dec.value != 4) {
                                          selected_dec = 4.obs;
                                        } else {
                                          selected_dec = 0.obs;
                                        }
                                        if (kDebugMode) {
                                          print(selected_dec.value);
                                        }
                                      });
                                    },
                                    child:
                                        Row(
                                      children: [
                                        const Text(
                                          " 🛡️  ",
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Remove API key ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: selected_dec.value == 4
                                                  ? Colors.black
                                                  : Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                    ),
                                // ),
                              )
                            : Container(),
                        Obx(() {
                          if (selected_dec.value == 4) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Container(
                                    padding:
                                        const EdgeInsets.only(left: 10, bottom: 20),
                                    child: const Text(
                                      "To remove API key press on the remove button",
                                      style: TextStyle(fontSize: 13),
                                    )),
                                Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(left: 10),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        bool shouldRemove = await showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const RemoveApiDialog(),
                                        );
                                        if (shouldRemove == true) {
                                          setState(() {
                                            if (selected_dec.value != 4) {
                                              selected_dec = 4.obs;
                                            } else {
                                              selected_dec = 0.obs;
                                            }
                                            if (kDebugMode) {
                                              print(selected_dec.value);
                                            }
                                          });
                                          con.remove_api();
                                          Get.to(()=>const SplashScreen());
                                        }
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                Colors.grey),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12))),
                                      ),
                                      child: const Text(
                                        "REMOVE API",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        }),





                         Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            width: size.width,
                            alignment: widget.questionary == true
                                ? Alignment.centerLeft
                                : Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (selected_dec.value != 5) {
                                    selected_dec = 5.obs;
                                  } else {
                                    selected_dec = 0.obs;
                                  }
                                  if (kDebugMode) {
                                    print(selected_dec.value);
                                  }
                                });
                                showDialog(
                                   context: context,
                                   builder: (context)=>const My_info(),);
                              },
                              child: widget.questionary == true
                                  ? const Row(
                                children: [
                                  Text(
                                    " 🛡️  ",
                                  ),
                                  Expanded(
                                    child: Text(
                                      "For any queries, issues and reports.",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                       color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                                  : const Text(
                                "🤝 For any queries, issues and reports.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue
                                ),
                              ),
                            ),
                            // ),
                         ),



                      ]))),
        )
    );
  }
}

