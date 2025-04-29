import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/login_provider.dart';

import '../../widgets/my_custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
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
                key: provider.keyform,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: MediaQuery.of(context).size.height * .03,
                  children: [
                    TextFormField(
                      controller: provider.emailController,
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
                      controller: provider.passwordController,
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
                    TextButton(
                      onPressed: () async {
                        provider.forgetPassword(context);
                      },
                      child:
                          provider.isLoading
                              ? CircularProgressIndicator(
                                color: Colors.blueAccent,
                              )
                              : Text(
                                'Forgot Password',
                                style: TextStyle(color: Colors.black),
                              ),
                    ),
                    MyCustomButton(
                      onTap: (){

                        provider.login(context);
                      },
                      name: 'Log In',
                      isLoading: provider.isLoginLoading,
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
                                  ..onTap = (){
                                    provider.goToDashboard(context);
                                  }
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
      },
    );
  }
}


