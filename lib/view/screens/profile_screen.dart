import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/view/screens/authentication_screens/signup_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          'Profile',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            color: Color(0xFF000000),
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance
                .collection('user')
                .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('ERROR OCCURRED ${snapshot.error}'));
          } else if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No Data Available'));
          } else {
            return Center(
              child: Column(
                children: [
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      color: Colors.teal,
                      height: 150,
                      width: 150,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    snapshot.data!.docs[0]['username'],

                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Text(
                    snapshot.data!.docs[0]['email'],
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFF808080),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(onPressed: (){
                    FirebaseAuth.instance.signOut().then((value){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context)=>SignupScreen()));
                    });
                  },
                      child: Text('Log out'))
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
