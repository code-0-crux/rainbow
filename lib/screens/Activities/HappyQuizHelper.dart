import 'package:flutter/material.dart';
import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/Activities/HappyQuizResult.dart';

class HappyQuizHelper extends ChangeNotifier{
  ConstantColors constantColors = ConstantColors();
  List ImageList = ["assets/happyquizimg1.jpg","assets/happyquizimg2.jpg","assets/happyquizimg3.jpg","assets/happyquizimg4.jpg","assets/happyquizimg5.jpg"];
  int index = 0;
  int score =0;
  int get getIndex => index;
  Widget quizBody({BuildContext context, String question, Color questionColor, var option1,var option2,var option3}){
    print(score);
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
                  child: Image.asset(ImageList[index].toString()),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10,right: 10,left: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: MaterialButton(onPressed: (){
                        score+=0;
                        index += 1;
                        notifyListeners();
                        // if(index==5){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=> HappyQuizResult(score)));
                        // }

                      }, child: Text(option1, style: TextStyle(color: Colors.white),),
                        color: constantColors.blueGreyColor,

                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10,right: 10,left: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: MaterialButton(onPressed: (){
                        score+=10;
                        index += 1;
                        notifyListeners();
                        // if(index==5){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=> HappyQuizResult(score)));
                        // }
                      }, child: Text(option2, style: TextStyle(color: Colors.white),),
                        color: constantColors.blueGreyColor,

                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10,right: 10,left: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: MaterialButton(onPressed: (){
                        score+=5;
                        index += 1;
                        notifyListeners();
                        // if(index==5){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=> HappyQuizResult(score)));
                        // }
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
        )
    );

  }

  Widget resultBody(BuildContext context){
    return Container(
      color: constantColors.darkColor,
      child: Column(
        children: [
          Container(
              child: Text(
                "After analyzing your decisions, we predict that ",
                style: TextStyle(
                  color: constantColors.greenColor,
                  fontSize: 16,


                ),
              )),
          Container(child: personTraits()),
          SizedBox(height: 300,width: MediaQuery.of(context).size.width,),
        ],
      ),
    );
  }
  Widget personTraits() {
    if (score == 0) {
      return Text(
        "You are quite an emotional person, you consider people's priority at the top level",
        style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold, fontSize: 16),
      );
    }
    if (score >= 35) {
      return Text(
          "You are quite a balanced person, most of your decisions are based on realistic solutions.Sometimes your emotions do dominate your decisions, but at the end it brings a positive result for you.",
          style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold, fontSize: 16));
    }
    if (score >= 25 && score < 35) {
      return Text(
          "You are quite a practical person, your decisions are usually based on the fact that the solutions to the problems are ought to be in a logical manner. Entangling in emotions is kind off not your way.",
          style: TextStyle(color: Colors.yellowAccent,fontWeight: FontWeight.bold, fontSize: 16));
    }
    if (score <= 15) {
      return Text(
        "You are more inclined towards emotional approach of solutions towards the problems in your way. Sometimes you do take decisions based on facts and current practical scenarios",
        style: TextStyle(color: Colors.purpleAccent,fontWeight: FontWeight.bold, fontSize: 16),
      );
    }
    if (score >= 15 && score < 25) {
      return Text(
          "You tend to take decisions based on realistic and logic approach to the problems that come your way. You do keep an emotional aspect to your solution,but it generally keeps a lower volume"
          ,style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold, fontSize: 16));
    }
  }

  Widget resultAppBar(){
    return AppBar(
      backgroundColor: constantColors.blueGreyColor,
      title: Text('Prediction',
        style: TextStyle(color: Colors.purpleAccent,
          fontSize: 18,),),
      actions: [
        IconButton(
            onPressed: (){

              index = 0;
              notifyListeners();
            }, icon: Icon(Icons.repeat)),


      ],
    );
  }


  Widget quizAppBar(){
    return AppBar(
      centerTitle: true,
      title: Text("Happy-Quiz",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),
      backgroundColor: constantColors.blueGreyColor,
    );
  }

}
