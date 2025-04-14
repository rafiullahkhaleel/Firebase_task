import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_task/view/home_screen.dart';
import 'package:firebase_task/view/screens/authentication_screens/otp_screen.dart';
import 'package:flutter/material.dart';

class AuthService{

  void phoneAuthentication(String phoneNumber,BuildContext ctx)async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential){},
        verificationFailed: (FirebaseAuthException error){
        ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(content: Text('ERROR: $error'))
        );
        },
        codeSent: (String verificationId,int? token){
        Navigator.push(ctx,
            MaterialPageRoute(builder: (ctx)=>OtpScreen(verificationId: verificationId,)));
        },
        codeAutoRetrievalTimeout: (String id){}
    );
  }


  void signInWithOTP(String verificationId, String otpCode,BuildContext ctx)async{
    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: otpCode);

      await FirebaseAuth.instance.signInWithCredential(credential).then((onValue){
        Navigator.push(ctx,
            MaterialPageRoute(builder: (ctx)=>HomeScreen()));
      });
    }catch(e){
      ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(content: Text('ERROR: $e'))
      );
    }
  }

}