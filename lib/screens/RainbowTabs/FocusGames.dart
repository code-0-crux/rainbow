import 'package:flutter/material.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/Games/MemoryGameNumber.dart';
import 'package:rainbow/screens/Games/MemoryGameWord.dart';

class FocusGames extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      appBar: AppBar(
        backgroundColor: constantColors.blueGreyColor.withOpacity(0.7),

        title: Text(
          "Regain Focus", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GestureDetector(

              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MemoryGameNumber()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                color: constantColors.blueGreyColor,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: constantColors.blueGreyColor,
                      ),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.45,
                      height: 200,
                      child: Column(
                        children: [
                          Text('Number Memory', style: TextStyle(
                              fontFamily: "Monteserat",
                              fontSize: 21,
                              color: Colors.yellowAccent),),
                          Divider(
                            color: constantColors.lightBlueColor, thickness: 2,),
                          Text('Experience healing with this simple practice',
                              style: TextStyle(fontFamily: "Poppins",
                                  fontSize: 18,
                                  color: Colors.greenAccent))
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.45,
                      height: 200,
                      decoration: BoxDecoration(

                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(0),


                          image: DecorationImage(
                            image: AssetImage('assets/Number.jpg'),
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MemoryGameWord()));
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
                          Text('Word Memory',style: TextStyle(fontFamily: "Monteserat", fontSize: 21,color: Colors.orangeAccent),),
                          Divider(color: constantColors.lightBlueColor,thickness: 2,),
                          Text('Relaxing Mental and Emotional Stress', style: TextStyle(fontFamily: "Poppins", fontSize: 18,color: Colors.greenAccent) )
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
                            image: AssetImage('assets/Word.jpg'),
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

    );
  }
}
