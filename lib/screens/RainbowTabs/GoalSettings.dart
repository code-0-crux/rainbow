import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/services/FirebaseWork.dart';
import 'package:rainbow/services/LogInWork.dart';

class GoalSettings extends StatefulWidget {


  @override
  _GoalSettingsState createState() => _GoalSettingsState();
}

class _GoalSettingsState extends State<GoalSettings> {
  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    TextEditingController goalTextController = TextEditingController();
    bool goalSet = false;

    //final ref = FirebaseFirestore.instance.collection("users").doc(Provider.of<LogInWork>(context,listen: false).getUserId);
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      appBar: AppBar(
        backgroundColor: constantColors.blueGreyColor.withOpacity(0.7),

        title: Text(
          "Goals", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Column(
          children: [
    //   Padding(
    //   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
    //   child: GestureDetector(
    //
    //     onTap: () {
    //       // Navigator.pushReplacement(
    //       //     context, MaterialPageRoute(builder: (context) => Meditation()));
    //     },
    //     child: Card(
    //       shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
    //               topRight: Radius.circular(20),r
    //               bottomLeft: Radius.circular(20),
    //               bottomRight: Radius.circular(20))),
    //       color: constantColors.blueGreyColor,
    //       child: Row(
    //         children: [
    //           Container(
    //             decoration: BoxDecoration(
    //               color: constantColors.blueGreyColor,
    //             ),
    //             width: MediaQuery
    //                 .of(context)
    //                 .size
    //                 .width * 0.45,
    //             height: 200,
    //             child: Column(
    //               children: [
    //                 Text('Your Goals', style: TextStyle(
    //                     fontFamily: "Monteserat",
    //                     fontSize: 21,
    //                     color: Colors.yellowAccent),),
    //                 Divider(
    //                   color: constantColors.lightBlueColor, thickness: 2,),
    //                 Text('Write short goals',
    //                     style: TextStyle(fontFamily: "Poppins",
    //                         fontSize: 18,
    //                         color: Colors.greenAccent))
    //               ],
    //             ),
    //           ),
    //           Spacer(),
    //           Container(
    //             width: MediaQuery
    //                 .of(context)
    //                 .size
    //                 .width * 0.45,
    //             height: 200,
    //             decoration: BoxDecoration(
    //
    //                 border: Border.all(
    //                   color: Colors.black,
    //                 ),
    //                 borderRadius: BorderRadius.circular(0),
    //
    //
    //                 image: DecorationImage(
    //                   image: AssetImage('assets/meditate.jpg'),
    //                   fit: BoxFit.cover,
    //                 )
    //             ),
    //           ),
    //
    //         ],
    //
    //
    //       ),
    //     ),
    //   ),
    // ),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
    //           child: GestureDetector(
    //
    //             onTap: (){
    //               //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Meditation()));
    //             },
    //             child: Card(
    //               shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
    //               color: Colors.purple,
    //               child: Row(
    //                 children:[
    //                   Container(
    //                     decoration: BoxDecoration(
    //                         color: Colors.purple
    //                     ),
    //                     width: MediaQuery.of(context).size.width*0.45,
    //                     height: 200,
    //                     child: Column(
    //                       children: [
    //                         Text('Create Goals',style: TextStyle(fontFamily: "Monteserat", fontSize: 21,color: Colors.orangeAccent),),
    //                         Divider(color: constantColors.lightBlueColor,thickness: 2,),
    //                         Text('Write a goal and set to achieve it', style: TextStyle(fontFamily: "Poppins", fontSize: 18,color: Colors.greenAccent) )
    //                       ],
    //                     ),
    //                   ),
    //                   Spacer(),
    //                   Container(
    //                     width: MediaQuery.of(context).size.width*0.45,
    //                     height: 200,
    //                     decoration: BoxDecoration(
    //
    //                         border: Border.all(
    //                           color: Colors.black,
    //                         ),
    //                         borderRadius: BorderRadius.circular(0),
    //
    //
    //                         image: DecorationImage(
    //                           image: AssetImage('assets/Yognidra.jpg'),
    //                           fit: BoxFit.cover,
    //                         )
    //                     ),
    //                   ),
    //
    //                 ],
    //
    //
    //               ),
    //             )
    //             ,
    //           )
    //           ,
    //
    //         ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: SizedBox(
                height: 40,
                width: 100,
                child: StreamBuilder(
                  //stream: FirebaseFirestore.instance.collection('users').doc(Provider.of<LogInWork>(context, listen: false).getUserId).collection('goal').snapshots(),
                  stream :,
                  builder: ( context, AsyncSnapshot<QuerySnapshot> snapshot){

                    return GridView.builder(
                      padding: EdgeInsets.only(top: 8.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                        itemCount: snapshot.hasData? snapshot.data.docs.length: 0,
                        itemBuilder: (context, index){
                      return  Row(

                        children: [
                          Text(snapshot.data.docs[index].data()['goal'].toString()),
                          Checkbox(value: goalSet, onChanged: (bool value){


                              Provider.of<FirebaseWork>(context,listen:false).goalDeleter(context);


                      })
                        ],
                      );
                    });
                  },
                ),
              ),
            ),
    //         Text(ref.),

            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Container(

                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      child: TextField(

                        controller: goalTextController,
                        style: TextStyle(color: Colors.yellow),
                        decoration: InputDecoration(
                         hintText: "Write your goal here",
                            hintStyle:TextStyle(color: Colors.yellow)

                        ),

                      ),
                    ),
                    IconButton(
                        onPressed: (){
                      Provider.of<FirebaseWork>(context, listen: false).goalSave(context, {
                        "goal": goalTextController.text,
                      });
                    goalTextController.clear();

                    }, icon: Icon(Icons.add_circle,color: Colors.green,))
                  ],
                ),
              ),
            )

  ]));
  }
}
