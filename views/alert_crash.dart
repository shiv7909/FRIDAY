

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class alert2 extends StatelessWidget {
  const alert2({super.key});

  @override
  Widget build(BuildContext context)
  {
    Size size=MediaQuery.of(context).size;
    return
      AlertDialog(
        alignment: Alignment.center,
        shadowColor: Colors.black87,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
        ),
        elevation: 10,
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

          Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(20),
                          topRight:Radius.circular(20),
                      ),
                    ),
                    width: 200,
                    transformAlignment: Alignment.bottomRight,

                    alignment: Alignment.center,
                    child: Lottie.asset("assists/repair guy.json"),
                  ),

            
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),
                  bottomRight:Radius.circular(20),
                ),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(10),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(Icons.signal_wifi_statusbar_connected_no_internet_4_outlined,color: Colors.blue,),
                      SizedBox(width: 15,),
                      Expanded(child: Text("please check your internet connection")),
                    ],
                  ),
                  SizedBox(height: 8,),

                  Row(
                    children: [
                      Icon(Icons.key,color: Colors.deepOrange,),
                      SizedBox(width: 15,),
                      Expanded(child: Text("Make sure you have entered correct API key")),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );


  }
}
