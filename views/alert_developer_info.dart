

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/launchers.dart';

class My_info extends StatelessWidget {
  const My_info({super.key});

  @override
  Widget build(BuildContext context) {
    Launchers launcher=Get.find<Launchers>();

    return AlertDialog(
      content:SizedBox(
            height: 80,
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "For any queries:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                    const Text("📩  Email us at "),
                const SizedBox(
                  height: 8,
                ),
                    Expanded(
                        child: GestureDetector(
                            onTap: () {
                              launcher.email_launch();
                            },
                            child: const Text(
                              "shiva547337@gmail.com",
                              style: TextStyle(color: Colors.blue),
                            )))
                //   ],
                // )
              ],
            ),
          ),
    );
  }
}
