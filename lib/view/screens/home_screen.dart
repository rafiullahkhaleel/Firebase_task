import 'package:firebase_task/view/screens/bottom_bar_screen.dart';
import 'package:firebase_task/view/screens/new_record.dart';
import 'package:firebase_task/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(width: width * .05),
            Expanded(child: Icon(Icons.perm_identity_outlined, size: 35)),
          ],
        ),
        title: Text(
          'Passwords',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            color: Color(0xFF000000),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>NewRecord()));
          },
              icon: Icon(Icons.add, size: 35)),
          SizedBox(width: width * .045),
        ],
      ),
      body: Column(children: []),
    );
  }
}
