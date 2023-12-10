import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/home.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginIn = false;

  registerUser() async {
    try {
      isLoginIn = true;
      setState(() {});
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homeview()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      isLoginIn = false;
      setState(() {});
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: emailController),
          TextField(controller: passwordController),
          ElevatedButton(
              onPressed: () {
                registerUser();
              },
              child: Text("Register")),
          Visibility(visible: isLoginIn, child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
