import 'package:flutter/material.dart';
import 'package:rainbow/constants/Constantcolors.dart';

class HappyQuizHelper extends ChangeNotifier{
  ConstantColors constantColors = ConstantColors();
  int index = 0;
  int get getIndex => index;
  Widget quizBody({BuildContext context, String question, Color questionColor, var option1,var option2,var option3}){

    // bro options will be a dictionary whose key will be question value will be traits or points to it.
    // i am leaving test at 2 15 ig so "mostly" tya nantr yeil. not sure though
    return SingleChildScrollView(

      child: Container(
        child: Column(
        children: [
          Container(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
              color: questionColor,
              child: Text(
                question,
                style: TextStyle(color: Colors.white,fontSize: 23),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.4,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/star4.jpg"),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10,right: 10,left: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.09,
                child: MaterialButton(onPressed: (){
                  index==1?index+=0:index+=1;

                  notifyListeners();

                }, child: Text(option1, style: TextStyle(color: Colors.white),),
                color: constantColors.blueGreyColor,

                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10,right: 10,left: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.09,
                child: MaterialButton(onPressed: (){
                  index==1?index+=0:index+=1;
                  notifyListeners();
                }, child: Text(option2, style: TextStyle(color: Colors.white),),
                  color: constantColors.blueGreyColor,

                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10,right: 10,left: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.09,
                child: MaterialButton(onPressed: (){

                  index==1?index+=0:index+=1;
                  notifyListeners();
                }, child: Text(option3, style: TextStyle(color: Colors.white),),
                  color: constantColors.blueGreyColor,

                ),
              ),

              // ListView.builder(itemBuilder: (BuildContext context, int index){
              //
              //  // return Card(
              //  //    child: Text(options.keys[index][0], style: TextStyle(color: Colors.white),),
              //  //
              //  //  );
              // }),
            ],
          )

      ]),
    ));
  }

  Widget quizAppBar(){
    return AppBar(
      centerTitle: true,
      title: Text("Happy-Quiz",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),
      backgroundColor: constantColors.blueGreyColor,
    );
  }
}
