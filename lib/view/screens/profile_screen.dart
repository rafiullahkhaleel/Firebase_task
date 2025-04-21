import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                color: Colors.teal,
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(height: 30,),
            Text('Rafiullah',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xFF000000)
            ),
            ),
            Text('rafiullah',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF808080)
            ),
            )
          ],
        ),
      ),
    );
  }
}
