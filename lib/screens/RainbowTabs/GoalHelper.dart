import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/services/FirebaseWork.dart';
import 'package:rainbow/services/LogInWork.dart';

class GoalHelper extends ChangeNotifier {
  List ColourList = [Colors.purple,Colors.indigo,Colors.lightBlueAccent,Colors.green,Colors.yellow,Colors.orange,Colors.red,];
  TextEditingController goalTextController = TextEditingController();
  ConstantColors constantColors = ConstantColors();

  Widget goalBody(BuildContext context) {
    final ref = Firestore.instance.collection("goals").doc(Provider
        .of<LogInWork>(context, listen: false)
        .getUserId).collection("myGoals");
    return StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return GridView.builder(

            shrinkWrap: true,
              itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),



              itemBuilder: (_, index)
          {
            return GestureDetector(

              onTap: () {
                showDialog(
                  context: context,
                  builder: (context)
                {
                  return AlertDialog(
                    backgroundColor: constantColors.darkColor,
                    title: Text(
                      'So, did you complete this goal?',
                      style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),

                    actions: [
                      Divider(color: constantColors.blueColor,),
                      MaterialButton(
                        onPressed: () {
                          Provider.of<FirebaseWork>(context, listen: false)
                              .goalComplete(context,
                              snapshot.data.docs[index].data()['activeGoal'])
                              .whenComplete(() =>
                              Provider.of<FirebaseWork>(context, listen: false)
                                  .goalDeleter(context,
                                  snapshot.data.docs[index].id.toString())).whenComplete(() => Provider.of<FirebaseWork>(context,listen: false).goalIncrement(context)).whenComplete(() => Navigator.pop(context));
                          print(snapshot.data.docs[index].id.toString());
                        },
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              color: constantColors.greenColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: constantColors.greenColor),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "No",
                          style: TextStyle(
                            color: constantColors.redColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  );
                });  },
              child: Container(


                color: ColourList[Random().nextInt(6)],
                margin: EdgeInsets.all(10),
                height: 150,
                child: Column(
                  children: [
                    Text(snapshot.data.docs[index].data()['activeGoal'],
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)

                  ],
                ),
              ),
            );
          },);

        });
  }

  Widget completedGoals(BuildContext context) {
    final ref = Firestore.instance.collection("goals").doc(Provider
        .of<LogInWork>(context, listen: false)
        .getUserId).collection("goalsDone");
    return Expanded(
        child:

              StreamBuilder(
                  stream: ref.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return GridView.builder(
                      physics: ScrollPhysics(),
                      itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),


                      itemBuilder: (_, index)
                      {
                        return Container(


                            color: ColourList[Random().nextInt(6)],
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(snapshot.data.docs[index].data()['completedGoals'],
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          );

                      },);

                  }),
              // Divider(color: Colors.purple),
              // Divider(color: Colors.indigo),
              // Divider(color: Colors.blue),
              // Divider(color: Colors.green),
              // Divider(color: Colors.yellow),
              




    );
  }

  Widget creator(BuildContext context){

    return Container(

      child: Row(
        children: [
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.7,
            child: TextField(
              maxLength: 150,


              controller: goalTextController,
              style: TextStyle(color: Colors.yellow),
              decoration: InputDecoration(
                  hintText: "Write your goal here",
                  hintStyle: TextStyle(color: Colors.yellow)

              ),

            ),
          ),
          IconButton(
              onPressed: () {
                Provider.of<FirebaseWork>(context, listen: false)
                    .goalAdder(context, {
                  "activeGoal": goalTextController.text,
                });
                goalTextController.clear();
              }, icon: Icon(Icons.add_circle, color: Colors.green,))
        ],
      ),
    );
  }

}
