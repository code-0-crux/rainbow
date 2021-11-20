import 'package:flutter/material.dart';
import 'package:rainbow/constants/Constantcolors.dart';

class Communication extends StatelessWidget {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      appBar: AppBar(
        backgroundColor: constantColors.blueGreyColor.withOpacity(0.7),
        title: Text(
          "Communicate Effectively",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GestureDetector(
              onTap: () {

              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
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
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      child: Column(
                        children: [
                          Text(
                            'Tip-1',
                            style: TextStyle(
                                fontFamily: "Monteserat",
                                fontSize: 21,
                                color: Colors.yellowAccent),
                          ),
                          Divider(
                            color: constantColors.lightBlueColor,
                            thickness: 2,
                          ),
                          Text("Stick to the facts",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  color: Colors.greenAccent))
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(0),
                          image: DecorationImage(
                            image: AssetImage('assets/comm1.jpg'),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GestureDetector(
              onTap: () {
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                color: Colors.purple,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.purple),
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      child: Column(
                        children: [
                          Text(
                            'Tip-2',
                            style: TextStyle(
                                fontFamily: "Monteserat",
                                fontSize: 21,
                                color: Colors.orangeAccent),
                          ),
                          Divider(
                            color: constantColors.lightBlueColor,
                            thickness: 2,
                          ),
                          Text('Listen more,than you talk',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  color: Colors.greenAccent))
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(0),
                          image: DecorationImage(
                            image: AssetImage('assets/comm5.jpg'),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GestureDetector(
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
                          Text('Tip-3', style: TextStyle(
                              fontFamily: "Monteserat",
                              fontSize: 21,
                              color: Colors.yellowAccent),),
                          Divider(
                            color: constantColors.lightBlueColor, thickness: 2,),
                          Text('Start Saying “And”,drop the “But”',
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
                            image: AssetImage('assets/comm4.jpg'),
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
              onTap: () {
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                color: Colors.purple,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.purple),
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      child: Column(
                        children: [
                          Text(
                            'Tip-4',
                            style: TextStyle(
                                fontFamily: "Monteserat",
                                fontSize: 21,
                                color: Colors.orangeAccent),
                          ),
                          Divider(
                            color: constantColors.lightBlueColor,
                            thickness: 2,
                          ),
                          Text('Be quite empathetic in your talk',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  color: Colors.greenAccent))
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(0),
                          image: DecorationImage(
                            image: AssetImage('assets/comm2.jpg'),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GestureDetector(
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
                          Text('Tip-5', style: TextStyle(
                              fontFamily: "Monteserat",
                              fontSize: 21,
                              color: Colors.yellowAccent),),
                          Divider(
                            color: constantColors.lightBlueColor, thickness: 2,),
                          Text('Observe good orators',
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
                            image: AssetImage('assets/comm3.jpg'),
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
