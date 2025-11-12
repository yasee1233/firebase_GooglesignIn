import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> signout() async {
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signed out successfully')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Text(
          "Login Page",
          style: TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => signout(),
        tooltip: 'Sign Out',
        backgroundColor: Colors.red,
        child: Icon(Icons.logout),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}