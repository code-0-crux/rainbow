import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rainbow/constants/Constantcolors.dart';
import 'package:rainbow/screens/Activities/Meditation.dart';
import 'package:rainbow/screens/Activities/StarGazing.dart';
import 'package:rainbow/screens/Games/MemoryGameNumber.dart';
import 'package:rainbow/screens/Journals/JournalFace.dart';
import 'package:rainbow/screens/StartScreen.dart';

import 'package:rainbow/services/FirebaseWork.dart';
import 'package:rainbow/services/LogInWork.dart';

import 'LogInPage.dart';

class LandingPageHelpers with ChangeNotifier {
  Widget signUpBody(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController userEmail = TextEditingController();
    return Container(
      decoration: BoxDecoration(
        color: constantColors.darkColor,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 60),
            alignment: AlignmentDirectional.center,
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'R',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 34.0),
                  ),
                  TextSpan(
                    text: 'a',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                        fontSize: 34.0),
                  ),
                  TextSpan(
                    text: 'i',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 34.0),
                  ),
                  TextSpan(
                    text: 'n',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 34.0),
                  ),
                  TextSpan(
                    text: 'b',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 34.0),
                  ),
                  TextSpan(
                    text: 'o',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 34.0),
                  ),
                  TextSpan(
                    text: 'w',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 34.0),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(20),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  image: DecorationImage(
                    image: AssetImage("assets/Anxiety5.jpg"),
                    fit: BoxFit.cover,
                  )),
              child: Column(
                children: [
                  TextField(
                    controller: username,
                    maxLength: 50,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: 'Enter Name',
                    ),
                  ),
                  TextField(
                    controller: userEmail,
                    maxLength: 50,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: 'Enter Email',
                    ),
                  ),
                  TextField(
                    controller: password,
                    maxLength: 50,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: 'Password',
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (username.text != null &&
                          userEmail.text != null &&
                          password.text != null) {
                        Provider.of<LogInWork>(context, listen: false)
                            .signUp(userEmail.text, password.text)
                            .whenComplete(() {
                          Provider.of<FirebaseWork>(context, listen:false)
                              .createNewUser(context, {
                            'userEmail': userEmail.text,
                            'userName': username.text,
                            'userId': Provider.of<LogInWork>(context,
                                listen: false)
                                .getUserId,
                            'goalCount': 0,
                            'journalCount':0,
                          });
                        })
                            .whenComplete(() => print("Signing Up"))
                            .whenComplete(() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartScreen()),
                        ));
                      } else {}
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      alignment: AlignmentDirectional.center,
                      child: Text('Sign Up',style:  TextStyle(fontWeight: FontWeight.bold),),
                      decoration:
                      BoxDecoration(color: constantColors.greenColor),
                    ),
                  ),
                  MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogInPage()),
                        );
                      },
                      child: Text('Already have an account? Log In instead',style:  TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
