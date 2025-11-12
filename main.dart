
import 'package:demo_prj/login.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 

  runApp(MyApp());
}


  //  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // runApp( MyApp());

class MyApp  extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Yaseen Malik ",
      home: LoginScreen(),
    );
  }
}
class TextClass extends StatelessWidget {
  const TextClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Yaseen Malik",style: TextStyle(fontSize: 100,color: Colors.blue),))
        ],
      )
    );
  }
}