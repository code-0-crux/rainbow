import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogInWork with ChangeNotifier{
  String userId;
  String get getUserId => userId;

  Future signUp(String email, String password) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //User user = userCredential.user;
      final user = await FirebaseAuth.instance.currentUser;
      userId = user.uid;

      print(userId);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  Future logIn(String email, String password) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user;
      userId = user.uid;
      print(userId);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  Future logOut() async{
    return FirebaseAuth.instance.signOut();

  }
}