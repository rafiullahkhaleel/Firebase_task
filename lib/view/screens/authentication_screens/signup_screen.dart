import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task/view/screens/authentication_screens/phone_login_screen.dart';
import 'package:task/view/screens/authentication_screens/register_screen.dart';
import '../bottom_bar_screen.dart';
import 'login_Screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;
  bool loading1 = false;
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Signup',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                spacing: MediaQuery.of(context).size.height * .03,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: 'User Name',
                      hintStyle: TextStyle(color: Colors.black45),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.black45),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black45),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else {
                        return null;
                      }
                    },
                  ),
                  InkWell(
                    onTap: () async {
                      // async banana ka baghair messengerScaffold main error show nahi hota
                      if (formKey.currentState!.validate()) {
                        try {
                          setState(() {
                            loading1 = true;
                          });
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                          await FirebaseFirestore.instance
                              .collection('user')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .set({
                                'username': nameController.text,
                                'email': emailController.text,
                                'uid': FirebaseAuth.instance.currentUser!.uid,
                              })
                              .then((value) {
                                setState(() {
                                  loading1 = false;
                                });
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BottomBarScreen(),
                                  ),
                                );
                              });
                        } catch (error) {
                          setState(() {
                            loading1 = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('ERROR OCCURRED $error')),
                          );
                        }
                        ;
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * .065,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black,
                      ),
                      child: Center(
                        child:
                            loading1 == false
                                ? Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                )
                                : CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'If you have already account ? ',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      children: [
                        TextSpan(
                          text: 'Log In',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                },
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>RegisterScreen()));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * .065,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black,
                      ),
                      child: Center(
                        child:
                        loading1 == false
                            ? Text(
                          'Continue with Phone Number',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        )
                            : CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
