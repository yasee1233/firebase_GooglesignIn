import 'package:demo_prj/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';

createUserWithEmailandPassword(String email , String password)async{
  try{
    final credential =await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password :password,
    );
  }on FirebaseAuthException catch(e){
    if(e.code ==" weak password"){
      print("THis password provided is too weak");
    }
    else if (e.code == "email arleady in use"){
      print("This account already exists for that email");
    }
  }catch(e){
    print(e);
  }
}
signInWithEmailAndPassword(String email , String password, BuildContext context)async{
  try{
    final credential =await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password :password,
    );
    User? user = credential.user;
    if(user != Null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }
  }on FirebaseAuthException catch(e){
    if(e.code ==" weak password"){
      print("THis password provided is too weak");
    }
    else if (e.code == "email arleady in use"){
      print("This account already exists for that email");
    }
  }
}