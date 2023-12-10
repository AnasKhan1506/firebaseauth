import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome to home"),
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            child: Text("Signout"),
          )
        ],
      ),
    );
  }
}
