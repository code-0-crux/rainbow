import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/RainbowTabs/GoalHelper.dart';
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
    // bool goalSet = false;
    //
    // final ref = FirebaseFirestore.instance.collection("users").doc(Provider
    //     .of<LogInWork>(context, listen: false)
    //     .getUserId);
    return Scaffold(
        backgroundColor: constantColors.darkColor,
        appBar: AppBar(
          backgroundColor: constantColors.blueGreyColor.withOpacity(0.7),

          title: Text(
            "Goals", style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body:  SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              
                child: Column(
                    children: [
                      Provider.of<GoalHelper>(context, listen: false).creator(context),
                      Provider.of<GoalHelper>(context, listen: false).goalBody(context),
                      Text("Hall Of Fame",style: TextStyle(color: Colors.red,fontSize: 20),),
                      Provider.of<GoalHelper>(context, listen: false).completedGoals(
                          context),
                    ],
                  ),
              ),
        ),
         
        
        );
  }
}
