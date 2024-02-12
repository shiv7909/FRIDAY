import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool showcontainer;

  // double containerSize = 50.0;

  @override
  void initState() {
    super.initState();
    showcontainer = false;

    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   setState(() {
    //     containerSize = containerSize == 50.0 ? 60.0 : 50.0;
    //   });
    // });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showcontainer = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
       backgroundColor: const Color(0x38090000),
    //  backgroundColor: Color(0xC2FCFCFC),
      body: SafeArea(
        child: Stack(children: [
          Container(

          ),
          Positioned(

                 top: 10,
                right: 30,


                    child: Column(

                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "F",
                          style: TextStyle(
                              fontSize: size.height * 0.06,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontFamily: "robort"),
                        ),
                        Text(
                          "R",
                          style: TextStyle(
                              fontSize: size.height * 0.025,
                              color: const Color(0xF96E6D6D),
                              fontFamily: "robort"),
                        ),
                        Text(
                          "I",
                          style: TextStyle(
                              fontSize: size.height * 0.025,
                              color: const Color(0xF96E6D6D),
                              fontFamily: "robort"),
                        ),
                        Text(
                          "D",
                          style: TextStyle(
                              fontSize: size.height * 0.025,
                              color: const Color(0xF96E6D6D),
                              fontFamily: "robort"),
                        ),
                        Text(
                          "A",
                          style: TextStyle(
                              fontSize: size.height * 0.025,
                              color: const Color(0xF96E6D6D),
                              fontFamily: "robort"),
                        ),
                        Text(
                          "Y",
                          style: TextStyle(
                              fontSize: size.height * 0.025,
                              color: const Color(0xF96E6D6D),
                              fontFamily: "robort"),
                        ),
                      ],
                    // )
                              ),
            //       ),
            // ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const MyHomePage(); // Replace YourNextPage with the actual page you want to navigate to
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = 0.0;
                    const end = 1.0;
                    const curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    var opacityAnimation = animation.drive(tween);

                    return Opacity(
                      opacity: opacityAnimation.value,
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(seconds: 2),
                ),
              );
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height*0.8,
                          width: size.width,
                    
                          child: Lottie.asset(
                            'assists/welcome_robort.json',
                            fit: BoxFit.contain,
                          ),
                        ),
                        if (showcontainer)
                        Card(
                          elevation: 4,
                          // color: Color(0xC38598F3),
                          color: Colors.blue,
                          child: Container(
                            alignment: Alignment.center,
                            height: size.height * 0.055,
                            width: size.width * 0.3,
                            child: const Text(
                              "Get Started",
                              style: TextStyle(
                                  fontFamily: "Widolte_Regular",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
