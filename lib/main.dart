import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_task/firebase_options.dart';
import 'package:firebase_task/view/screens/home_screen.dart';
import 'package:firebase_task/view/screens/introduction_screens/first_introduction_screen.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


