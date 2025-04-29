import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../view/screens/bottom_bar_screen.dart';

class SignInProvider extends ChangeNotifier{
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isSignInLoading = false;
  bool loading1 = false;

  bool get isSignInLoading => _isSignInLoading;

  set isSignInLoading(bool value){
    _isSignInLoading = value;
    notifyListeners();
  }

  Future<void> signIn(BuildContext context)async{
    if (formKey.currentState!.validate()) {
      try {
        isSignInLoading = true;
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
          isSignInLoading = false;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomBarScreen(),
            ),
          );
        });
      } catch (error) {
        isSignInLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ERROR OCCURRED $error')),
        );
      }
      ;
    }
  }
}