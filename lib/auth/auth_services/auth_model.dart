import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // createCredentials
 Future createUserCredentials(String name, String phoneNumber, String email, String password) async{
   try{
     UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
     User? user = result.user;
     debugPrint('email: ${user?.email}\npwd: ${user?.phoneNumber} \n UID: ${user?.uid}');
     return user;
   }catch(e) {
     debugPrint(e.toString());
   }

 }

  //SignIn with Email & Password
  Future loginUserCredential(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      debugPrint(user!.uid);
      return user;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future logOutKoala() async{
    try{
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}