import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/random_password.dart';

class NewRecordProvider extends ChangeNotifier{
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RandomPasswordGenerate passwordGenerate = RandomPasswordGenerate();

  bool checkedField() {
    return passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty;
  }

  String selectedOption = 'Education';

  bool _isLoading = false;
  bool _isCheckedNumbers = false;
  bool isCheckedSymbols = false;
  bool isCheckedLowerCase = false;
  bool isCheckedUpperCase = false;
  double sliderValue = 4;

  bool get isLoading => _isLoading;
  bool get isCheckedNumbers => _isCheckedNumbers;

  set isLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  set isCheckedNumbers(bool value){
    _isCheckedNumbers = value;
    notifyListeners();
  }






  bool field1() {
    return nameController.text.length >= 3;
  }

  bool field2() {
    return emailController.text.length >= 3;
  }

  bool field3() {
    return passwordController.text.length >= 4;
  }

  password(){
    passwordController.text = passwordGenerate
        .generateRandomPassword(
      sliderValue.toInt(),
      isCheckedUpperCase,
      isCheckedLowerCase,
      isCheckedNumbers,
      isCheckedSymbols,
    );
    field3();
  }

  Future<void> savePassword(BuildContext context) async {
    try {
        isLoading = true;
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(
        DateTime.now().millisecondsSinceEpoch
            .toString(),
      )
          .set({
        'platformName': nameController.text,
        'emailName': emailController.text,
        'category': selectedOption,
        'password': passwordController.text,
        'uid':
        FirebaseAuth
            .instance
            .currentUser!
            .uid,
      })
          .then((v) {
          isLoading = false;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          SnackBar(
            content: Text('SAVED SUCCESSFULLY'),
          ),
        );
      });
    } catch (e) {
        isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ERROR OCCURRED $e')),
      );
    }
  }
}