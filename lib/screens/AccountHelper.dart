import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/services/FirebaseWork.dart';
import 'package:rainbow/services/LogInWork.dart';
import 'package:page_transition/page_transition.dart';
import 'LandingPage/LandingPage.dart';

class AccountHelper extends ChangeNotifier{
  ConstantColors constantColors = ConstantColors();
  Widget headerProfile(BuildContext context, DocumentSnapshot snapshot) {

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 220.0,
            width: 180.0,
            child: Column(
              children: [
                GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: constantColors.blueGreyColor,
                    radius: 50,
                    backgroundImage: AssetImage("assets/userpic.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    snapshot.data()['userName'],
                    style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget divider() {
    return Center(
      child: SizedBox(
        height: 25,
        width: 350,
        child: Divider(
          color: constantColors.yellowColor,
        ),
      ),
    );
  }

  Widget middleProfile(BuildContext context, dynamic snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
            ),
            child:
                Text("You Are Awesome",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: constantColors.whiteColor,
                    )
            ),
          ),
          // Padding(
          //     padding: const EdgeInsets.only(top: 8.0),
          //     child: Container(
          //       height: MediaQuery.of(context).size.height * 0.1,
          //       width: MediaQuery.of(context).size.width,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(15),
          //           color: constantColors.darkColor.withOpacity(0.4)),
          //     )),
        ],
      ),
    );
  }

  Widget footerProfile(BuildContext context, dynamic snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        child: Column(
          children: [
            Provider.of<FirebaseWork>(context,listen:false).getInitUserGoalCount.toString()!=null? Text("Your achieved goals: ${Provider.of<FirebaseWork>(context,listen:false).getInitUserGoalCount.toString()}",style: TextStyle(color: Colors.black,fontSize: 30),):Text("Opps! No goals to display, create goals from boost confidence",style: TextStyle(color: Colors.red, fontSize:30),),
            Provider.of<FirebaseWork>(context,listen: false).getInitUserJournalCount.toString()!=null?Text("Your written journals: ${Provider.of<FirebaseWork>(context,listen:false).getInitUserJournalCount.toString()}",style: TextStyle(color: Colors.black,fontSize: 30),):Text("Opps! No written journals to display, create journals from Journal Tab",style: TextStyle(color: Colors.red, fontSize:30),),
          ],
        ),
        //Text("Completed Goals: ${Provider.of<FirebaseWork>(context,listen:false).getInitUserGoalCount.toString()!=null?Provider.of<FirebaseWork>(context,listen:false).getInitUserGoalCount.toString():0}"),
        height: MediaQuery.of(context).size.height * 0.53,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/rainbowImage.jpg',),fit: BoxFit.cover
          ),
          color: constantColors.darkColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  logOutDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(

            backgroundColor: constantColors.darkColor,
            title: Text(
              'Log Out Of The Rainbow?',
              style: TextStyle(
                  color: constantColors.yellowColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
            actions: [
              MaterialButton(onPressed: (){
                Navigator.pop(context);
              },child: Text("No",style: TextStyle(
                  color: constantColors.greenColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: constantColors.greenColor
              ),),),


              MaterialButton(onPressed: (){
                Provider.of<LogInWork>(context,listen:false).logOut().whenComplete(() {
                  Navigator.pushReplacement(context, PageTransition(child: LandingPage(), type: PageTransitionType.bottomToTop));
                });

              },
                child: Text("Yes",style: TextStyle(
                  color: constantColors.redColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,

                ),),)
            ],
          );
        });
  }
}