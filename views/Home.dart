import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

import '../controllers/controller_api.dart';
import '../controllers/picimagecontroller.dart';
import '../controllers/themecontroller.dart';
import 'Entering_api.dart';
import 'basewallpaper.dart';
import 'camera.dart';
import 'newappbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Themecontroller themecontroller = Get.put(Themecontroller());
  api_controller Api = Get.find<api_controller>();
  ImagePic pi = Get.put(ImagePic());

  FocusNode focusNode = FocusNode();
  bool isTextInputFocused = false;

  late Uint8List? selected = null;
  late String? path = null;

  // final gemini = Gemini.instance;

  ChatUser myself = ChatUser(id: "1", firstName: "User");
  ChatUser bot = ChatUser(id: "2", firstName: "FRIDAY");

  List<ChatMessage> allMessages = <ChatMessage>[];

  List<ChatUser> typing = [];

  final header = {'Content-Type': 'application/json'};

  //
  // curl \
  // -H 'Content-Type: application/json' \
  // -d '{"contents":[{"parts":[{"text":"Write a story about a magic backpack"}]}]}' \
  // -X POST https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=YOUR_API_KEY
  //

  Future<void> navigateToCameraScreen() async {
    await Get.to(() => const CameraCaptureScreen());

    selected = pi.cameraImagebytes;
    path = pi.path!.value;

    print("$path");
    print("$selected");

    setState(() {});
    return Future.value(null);
  }

  Future<void> getdata(ChatMessage m, BuildContext dialogcontext) async {
    typing.add(bot);
    allMessages.insert(0, m);
    setState(() {});

    //  print("${Api.api_key}");

    String? finalresult;

    try {
      var data =
          // (selected!=null) ?
          //  {"contents": [{ "parts": [{ "inlineData": {"mimeType": "selected!", "data":selected!}},{"text": m.text}]}]}:

          {
        "contents": [
          {
            "parts": [
              {"text": m.text}
            ]
          }
        ]
      };

      if (selected != null) {
        //
        //
        // var response =
        //    await gemini.textAndImage(text: m.text, images: [selected!]);

        Map<String, dynamic> requestData = {
          'contents': [
            {
              'parts': [
                {'text': m.text},
                {
                  'inlineData': {
                    'mimeType': 'image/jpeg',
                    'data': base64Encode(selected!)
                  }
                }
              ]
            }
          ]
        };

        await http
            .post(Uri.parse(Api.our_url2.value),
                headers: <String, String>{
                  'Content-Type': 'application/json',
                },
                body: jsonEncode(requestData))
            .then((value) {
          if (value.statusCode == 200) {
            var result = jsonDecode(value.body);

            finalresult =
                result["candidates"][0]["content"]["parts"][0]["text"];
          } else {
            typing.remove(bot);
            finalresult = "please enter the correct API key buddy";
            setState(() {});
            if (kDebugMode) {
              print("error");
            }
          }
        }).catchError((e) {
          if (kDebugMode) {
            print("$e");
          }
        });
      } else {
        if (kDebugMode) {
          print(Api.our_url1.value);
        }
        await http
            .post(Uri.parse(Api.our_url1.value),
                headers: header, body: jsonEncode(data))
            .then((value) {
          if (value.statusCode == 200) {
            var result = jsonDecode(value.body);

            finalresult =
                result["candidates"][0]["content"]["parts"][0]["text"];
          } else {
            typing.remove(bot);
            finalresult =
                "please enter the correct API key buddy or unable to analyse picture";
            setState(() {});
            if (kDebugMode) {
              print("error");
            }
          }
        }).catchError((e) {
          if (kDebugMode) {
            print("$e");
          }
        });
      }

      ChatMessage chatMsg = ChatMessage(
        text:
            finalresult ?? "", // Use null check operator to handle null result
        user: bot,
        createdAt: DateTime.now(),
        customProperties: {
          'selectable': true,
        },
      );

      Future.microtask(() {
        allMessages.insert(0, chatMsg);
        typing.remove(bot);
        setState(() {});
      });
    } catch (e) {
      if (kDebugMode) {
        print("error");
      }

      ChatMessage chatMsg = ChatMessage(
        text: "$e",
        user: bot,
        createdAt: DateTime.now(),
      );
      Future.microtask(() {
        allMessages.insert(0, chatMsg);
        typing.remove(bot);
        setState(() {});
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Api.fetch_api();
  }

  @override
  Widget build(BuildContext context) {
    ui.Size size = MediaQuery.of(context).size;

    final dialogcontext = context;

    focusNode.addListener(() {
      setState(() {
        isTextInputFocused = focusNode.hasFocus;
      });
    });

    // ChatMessage message=ChatMessage(
    //     user: myself,
    //     createdAt: DateTime.now(),
    //     medias: MediaType.image
    // );

    return SafeArea(
      child: Scaffold(
          appBar: const APPBAR(),
          body: Obx(() {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Stack(children: [
                DashChat(
                  inputOptions: InputOptions(
                      leading: [
                        IconButton(
                            onPressed: () async {
                              bool wts = await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: const Text("Image :"),
                                      elevation: 5,
                                      alignment: Alignment.center,
                                      actionsAlignment:
                                          MainAxisAlignment.center,
                                      actionsPadding: const EdgeInsets.only(
                                          top: 10, bottom: 20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      actions: [
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.of(context).pop(
                                                false); // Dismiss the dialog with false
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.black54,
                                          ),
                                          child: const Text(
                                            "    Upload    ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(
                                                true); // Dismiss the dialog with true
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.black54,
                                          ),
                                          child: const Text(
                                            "Use camera",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    );
                                  });

                              if (wts) {
                                navigateToCameraScreen();
                              }

                              if (wts == false) {
                                Uint8List? imageBytes = await pi.getImage();
                                selected = imageBytes;

                                path = pi.path!.value;
                                print("path is                $path");
                                setState(() {});
                              }
                            },
                            icon: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45),
                                  color: Colors.black,
                                ),
                                child: const Icon(
                                  Icons.camera,
                                  color: Colors.white,
                                )))
                      ],
                      alwaysShowSend: true,
                      sendOnEnter: true,
                      sendButtonBuilder: (onsend) {
                        return IconButton(
                            onPressed: () {
                              onsend();
                            },
                            icon: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45),
                                  color: Colors.black,
                                ),
                                child: const Icon(
                                  Icons.send,
                                  color: Colors.white,
                                )));
                      },
                      focusNode: focusNode,
                      inputDecoration: const InputDecoration(
                        hintText: "Message to Friday",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        contentPadding: EdgeInsets.all(15),
                      ),
                      inputMaxLines: 30,
                      inputToolbarPadding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        bottom: 12,
                        top: 12,
                      ),
                      inputToolbarStyle: const BoxDecoration()),

                  //all about messages here

                  messageOptions: MessageOptions(
//1
                    avatarBuilder: (user, onPressed, onLongPressed) {
                      // Replace this with your custom avatar widget
                      return GestureDetector(
                        onTap: () {},
                        onLongPress: () {},
                        child: Container(
                          margin: const EdgeInsets.only(right: 5, left: 2),
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assists/Screenshot 2024-02-11 020336.png"),
                                  fit: BoxFit
                                      .fill) // Customize the avatar color as needed
                              ),
                        ),
                      );
                    },

//2

                    onLongPressMessage: (ChatMessage message) {
                      Clipboard.setData(ClipboardData(text: message.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Message copied to clipboard'),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.black,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      );
                    },

//3
                    messageTextBuilder:
                        (message, previousMessage, nextMessage) {
                      return Text(message.text,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.7,
                          ));
                    },

//4
                    userNameBuilder: (bot) {
                      return Container(
                          padding: const EdgeInsets.only(bottom: 5, left: 8),
                          child: Text(
                            "${bot.firstName}",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 11),
                          ));
                    },

//5
                    messageDecorationBuilder:
                        (message, previousMessage, nextMessage) {
                      // Check if the message is sent by the current user
                      bool isCurrentUserMessage = message.user.id == myself.id;

                      // Define decoration for current user's message
                      BoxDecoration currentUserDecoration = BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),

                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.1, 0.2),
                              blurRadius: 1)
                        ],

                        color: Colors.grey.shade100,
                        // Change this to the desired color for the current user
                      );

                      // Define decoration for other users' messages
                      BoxDecoration otherUserDecoration = BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),

                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.1, 0.2),
                              blurRadius: 1)
                        ],

                        color: Colors.grey
                            .shade100, // Change this to the desired color for other users
                      );

                      // Return the appropriate decoration based on the sender of the message
                      return isCurrentUserMessage
                          ? currentUserDecoration
                          : otherUserDecoration;
                    },

                    //6
                  ),

                  typingUsers: typing,
                  currentUser: myself,

                  onSend: (ChatMessage m) {
                    if (selected != null) {
                      ChatMedia media = ChatMedia(
                          url:
                              "$path", // Set this to the URL of the image if available, otherwise leave it empty
                          fileName:
                              "image.jpg", // Set the file name of the image
                          type: MediaType.image,
                          customProperties: {}
                          // You can add custom properties if needed
                          // isUploading: true, // Indicate that the image is currently being uploaded
                          );

                      ChatMessage myMessage = ChatMessage(
                        user: myself,
                        createdAt: DateTime.now(),
                        text: m.text,
                        medias: [media],
                      );
                      getdata(myMessage, dialogcontext);
                      selected = null;
                      setState(() {});
                    } else {
                      getdata(m, dialogcontext);
                    }
                  },

                  messages: allMessages,
                ),
                if (selected != null)
                  Positioned(
                    bottom: 80,
                    left: 15,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: MemoryImage(selected!),
                              //   fit: BoxFit.cover
                            )),
                        height: size.height * 0.35,
                        width: size.width / 2,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = null;
                            });
                          },
                          child: Stack(children: [
                            Positioned(
                                top: 5,
                                right: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: Colors.white),
                                  child: const Icon(Icons.keyboard_arrow_down),
                                )),
                          ]),
                        )),
                  ),
                if (Api.api_key.value.isEmpty) const WelcomeWidget(),
                if (Api.api_key.value.isNotEmpty && selected == null)
                  if (allMessages.isEmpty && isTextInputFocused == false)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Lottie.asset("assists/msg .ami.json"),
                        ),
                        BaseWall(),
                      ],
                    ),
              ]),
            );
          })),
    );
  }
}
