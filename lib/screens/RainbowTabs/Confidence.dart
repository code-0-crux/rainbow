import 'package:flutter/material.dart';
import 'package:rainbow/constants/Constantcolors.dart';

import 'GoalSettings.dart';

class Confidence extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    ConstantColors constantColors = ConstantColors();

    return Scaffold(
      appBar: AppBar(

      ),

      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: GestureDetector(

                onTap: (){
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Journal("Emotion Management")));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                  color: Colors.purple,
                  child: Row(
                    children:[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.purple
                        ),
                        width: MediaQuery.of(context).size.width*0.45,
                        height: 200,
                        child: Column(
                          children: [
                            Text('Write it out!',style: TextStyle(fontFamily: "Monteserat", fontSize: 21,color: Colors.orangeAccent),),
                            Divider(color: constantColors.lightBlueColor,thickness: 2,),
                            Text("Create an awareness of what's stopping you", style: TextStyle(fontFamily: "Poppins", fontSize: 18,color: Colors.greenAccent) )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width*0.45,
                        height: 200,
                        decoration: BoxDecoration(

                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(0),


                            image: DecorationImage(
                              image: AssetImage('assets/Diary4.jpg'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),

                    ],


                  ),
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: GestureDetector(

                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GoalSettings()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                  color: Colors.purple,
                  child: Row(
                    children:[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.purple
                        ),
                        width: MediaQuery.of(context).size.width*0.45,
                        height: 200,
                        child: Column(
                          children: [
                            Text('Short term Goal Setting',style: TextStyle(fontFamily: "Monteserat", fontSize: 21,color: Colors.orangeAccent),),
                            Divider(color: constantColors.lightBlueColor,thickness: 2,),
                            Text("Goal setting is must", style: TextStyle(fontFamily: "Poppins", fontSize: 18,color: Colors.greenAccent) )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width*0.45,
                        height: 200,
                        decoration: BoxDecoration(

                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(0),


                            image: DecorationImage(
                              image: AssetImage('assets/Diary1.jpg'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),

                    ],


                  ),
                ),
              ),

            ),
          ],
        ),
      ),

    );
  }
}
