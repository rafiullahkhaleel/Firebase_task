import 'package:task/view/screens/authentication_screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/rectangle_widget.dart' show Rectangle;

class ThirdIntroductionScreen extends StatefulWidget {
  const ThirdIntroductionScreen({super.key});

  @override
  State<ThirdIntroductionScreen> createState() =>
      _ThirdIntroductionScreenState();
}

class _ThirdIntroductionScreenState extends State<ThirdIntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * .06),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Rectangle(color: Color(0xFF292D32)),
                  Rectangle(color: Color(0xFF292D32)),
                  Rectangle(color: Color(0xFF292D32)),
                ],
              ),
              SizedBox(height: height * .07),
              Image.asset(
                'assets/group.png',
                height: height * .171,
                width: width * .3,
              ),
              Text(
                'Passblock',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 49,
                  color: Color(0xFF292D32),
                ),
              ),
              Text(
                'Frictionless Security',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 26,
                  color: Color(0xFF000000),
                ),
              ),
              SizedBox(height: height * .35),
              CustomButton(
                string: Text(
                  'Register',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                color: Color(0xFF292D32),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>RegisterScreen()));
                },
              ),
              SizedBox(height: height * .025),
              CustomButton(
                onTap: () {

                },
                string: Text(
                  'Already have an account',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
