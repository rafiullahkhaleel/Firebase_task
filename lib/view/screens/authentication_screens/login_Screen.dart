import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task/view/screens/authentication_screens/signup_screen.dart';
import '../bottom_bar_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final keyform = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;
  bool loading1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log In',
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
            key: keyform,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: MediaQuery.of(context).size.height * .03,
              children: [
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
                    if (value!.isEmpty) {
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
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    } else {
                      return null;
                    }
                  },
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      setState(() {
                        loading1 = true;
                      });
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: emailController.text)
                          .then((onValue) {
                            setState(() {
                              loading1 = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'The password reset link has been sent to your email',
                                ),
                              ),
                            );
                          });
                    } catch (e) {
                      setState(() {
                        loading1 = false;
                      });
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  child:
                      loading1 == false
                          ? Text(
                            'Forgot Password',
                            style: TextStyle(color: Colors.black),
                          )
                          : CircularProgressIndicator(color: Colors.blueAccent),
                ),
                InkWell(
                  onTap: () async {
                    if (keyform.currentState!.validate()) {
                      try {
                        setState(() {
                          loading = true;
                        });
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text).then((value){
                          setState(() {
                            loading = false;
                          });
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context)=>BottomBarScreen()));
                        });
                      } catch (error) {
                        setState(() {
                          loading = false;
                        });
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('$error')));
                      }
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * .07,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                    ),
                    child: Center(
                      child:
                          loading == false
                              ? Text(
                                'Log In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              )
                              : CircularProgressIndicator(color: Colors.white),
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "If you don't have already account ? ",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
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
                                    builder: (context) => SignupScreen(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
