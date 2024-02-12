



import 'package:flutter/material.dart';

class BaseWall extends StatelessWidget {
   BaseWall({super.key});

  List<String> myList={
    "Always secure your Api key in a safe place",
    "To copy text, Long press on the text.",
  }.toList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hi, how can i help you today?",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600
            ),),
            const SizedBox(height: 30,),
            Text("Tips:",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600
            ),),


            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: myList.length,
                  itemBuilder: (BuildContext,index){
                   return  Column(
                     children: [
                       Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.grey.shade700
                              )
                          ),
                          child:  Text(myList[index],style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600
                          ),),
                        ),
                       const SizedBox(height: 8,)
                     ],
                   );
                  }
                ),
            ),

          ],
        ),
      ),
    );
  }
}

