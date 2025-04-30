import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/signup_provider.dart';
import 'package:task/view/screens/authentication_screens/register_screen.dart';
import 'package:task/view/widgets/custom_field.dart';
import 'package:task/view/widgets/my_custom_button.dart';
import 'login_Screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SignInProvider>(
      builder: (context, provider, child) {
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
                key: provider.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    spacing: MediaQuery.of(context).size.height * .03,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomField(
                        controller: provider.nameController,
                        hintText: 'User Name',
                        validationText: 'Please enter your Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      CustomField(
                        controller: provider.emailController,
                        hintText: 'email',
                        validationText: 'Please enter your Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      CustomField(
                        controller: provider.passwordController,
                        hintText: 'Password',
                        validationText: 'Please enter your Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      MyCustomButton(
                        onTap: () {
                          provider.signIn(context);
                        },
                        isLoading: provider.isSignInLoading,
                        name: 'Sign In',
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
                      MyCustomButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        name: 'Continue with Phone Number',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
