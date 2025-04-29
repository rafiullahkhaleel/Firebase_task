import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../view/screens/authentication_screens/signup_screen.dart';
import '../view/screens/bottom_bar_screen.dart';

class LoginProvider extends ChangeNotifier {
  final keyform = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _isLoading = false;
  bool _isLoginLoading = false;

  bool get isLoading => _isLoading;

  bool get isLoginLoading => _isLoginLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set isLoginLoading(bool value) {
    _isLoginLoading = value;
    notifyListeners();
  }

  Future<void> login(BuildContext context)async{
    if (keyform.currentState!.validate()) {
      try {
        isLoginLoading = true;
       await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            )
            .then((value) {
              isLoginLoading = false;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BottomBarScreen()),
              );
            });
      } catch (error) {
        isLoginLoading = false;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$error')));
      }
    }
  }

  forgetPassword(BuildContext context) async {
    try {
      isLoading = true;
      await auth.sendPasswordResetEmail(email: emailController.text).then((
        onValue,
      ) {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'The password reset link has been sent to your email',
            ),
          ),
        );
      });
    } catch (e) {
      isLoading = false;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  goToDashboard(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }
}
