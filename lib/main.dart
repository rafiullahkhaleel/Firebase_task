import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:task/firebase_options.dart';
import 'package:task/provider/bottom_bar_provider.dart';
import 'package:task/provider/login_provider.dart';
import 'package:task/provider/new_record_provider.dart';
import 'package:task/provider/search_provider.dart';
import 'package:task/provider/signup_provider.dart';
import 'package:task/view/screens/authentication_screens/login_Screen.dart';
import 'package:task/view/screens/authentication_screens/signup_screen.dart';
import 'package:task/view/screens/bottom_bar_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    }
  } catch (e) {
    print("Firebase already initialized: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (create)=>LoginProvider()),
        ChangeNotifierProvider(create: (create)=>SignInProvider()),
        ChangeNotifierProvider(create: (create)=>BottomBarProvider()),
        ChangeNotifierProvider(create: (create)=>NewRecordProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirebaseAuth.instance.currentUser == null ? SignupScreen() : BottomBarScreen()
      ),
    );
  }
}
