
import 'package:demo_prj/Home.dart';
import 'package:demo_prj/facebook.dart';
import 'package:demo_prj/firebase.dart';
import 'package:demo_prj/screens/forget.dart';
import 'package:demo_prj/screens/signup.dart';
import 'package:demo_prj/uihelper.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController n01controller = TextEditingController();
  TextEditingController n02controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            UiHelper.CustomText(
              text: "Login",
              height: 30,
              fontweight: FontWeight.bold,
            ),
            UiHelper.CustomTextField(
              controller: n01controller,
              tohide: false,
              text: "Email",
              textinputtype: TextInputType.multiline,
              textinputaction: TextInputAction.next
            ),
            SizedBox(height: 15),
            UiHelper.CustomTextField(
              controller: n02controller,
              tohide: true,
              text: "Password",
              textinputtype: TextInputType.multiline,
              textinputaction: TextInputAction.done,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UiHelper.CustomTextButton(
                    text: "Forget password?",
                    callback: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPass()));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                   signInWithEmailAndPassword(n01controller.text, n02controller.text,context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  foregroundColor: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8, // Shadow depth
                ),
                child: Text('Log in'),
              ),
            ),
            SizedBox(height: 20),
            Container(
               height: 50,
              width: 180,
                decoration: BoxDecoration(
    color: Colors.black, // Background color
    shape: BoxShape.rectangle, // Shape: circle, can be BoxShape.rectangle
    border: Border.all(color: Colors.white, width: 4),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: Offset(4, 4),
      ),
    ],
  ),
  foregroundDecoration: BoxDecoration(
    color: Colors.black.withOpacity(0.2), // Foreground overlay
    shape: BoxShape.rectangle,
  ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(Icons.facebook,color: Colors.blue,),
                  UiHelper.CustomTextButton(
                    text: "Login With Facebook",
                    callback: () async {
                       await AuthService().signInWithGoogle(
                        context);

                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Center(child: SizedBox(height: 20, width: 20, child: Text("OR"))),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.CustomText(text: "Don't have an account?", height: 15),
                UiHelper.CustomTextButton(
                  callback: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SingUp()));
                  },
                  text: "Sign Up",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//login screen