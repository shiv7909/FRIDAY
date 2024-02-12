

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullImage extends StatelessWidget {
  String image;
   FullImage({super.key,
    required this.image
    });

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            height: size.height*0.8,
            width: size.width*0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Hero(
              tag: "FullImage",
              child: Image.asset(image),
            ),
          ),
        ),
      ),
    );
  }
}
