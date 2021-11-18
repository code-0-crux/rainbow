import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LogInWork.dart';

class FirebaseWork with ChangeNotifier{

  String initUserEmail;
  String initUserName;


  String get getInitUserName => initUserName;
  String get getInitUserEmail => initUserEmail;


  Future createNewUser(BuildContext context, dynamic data) async{
    return FirebaseFirestore.instance.collection("users").doc(Provider.of<LogInWork>(context, listen:false).getUserId).set(data);
  }

  Future initialiseData(BuildContext context) async{
    return FirebaseFirestore.instance.collection('users').doc(
        Provider.of<LogInWork>(context,listen: false).getUserId).get().then((doc) {
      print("Getting User Data");
      initUserName  = doc.data()['userName'];
      initUserEmail = doc.data()['userEmail'];
      print(initUserName);
      print(initUserEmail);

      notifyListeners();
    });
  }
}