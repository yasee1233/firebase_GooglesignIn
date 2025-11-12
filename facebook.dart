import 'package:demo_prj/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
 final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  // ignore: body_might_complete_normally_nullable
  Future<UserCredential?> signInWithGoogle( BuildContext context) async {
    try {
      await _googleSignIn.initialize(serverClientId: "252198038141-a9td15lbo28tjjh62rh4id159kaofkok.apps.googleusercontent.com",);
      final googleUser = await _googleSignIn.authenticate();
      if (googleUser == null) return null; // User cancelled

      final  googleAuth =  googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

     final userCredential = await _auth.signInWithCredential(credential);
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
     return userCredential;
    } catch (e) {
      print("Google Sign-In error: $e");
      return null;
    }
  }
  

  Future<void> signOut() async {
    await GoogleSignIn.instance.signOut();
    await _auth.signOut();
  }

  User? get currentUser => _auth.currentUser;
}

