
import 'package:task/view/screens/introduction_screens/third_introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/rectangle_widget.dart' show Rectangle;

class SecondIntroductionScreen extends StatefulWidget {
  const SecondIntroductionScreen({super.key});

  @override
  State<SecondIntroductionScreen> createState() => _SecondIntroductionScreenState();
}

class _SecondIntroductionScreenState extends State<SecondIntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * .06),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Rectangle(color: Color(0xFF292D32)),
                  Rectangle(color: Color(0xFF292D32)),
                  Rectangle(),
                ],
              ),
              SizedBox(height: height * .07),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/box.png',
                  height: height * .281,
                  width: width * .5,
                ),
              ),
              SizedBox(height: height * .075),
              Text(
                'Fast',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF000000),
                ),
              ),
              Container(
                width: width * .1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(47),
                  border: Border.all(color: Color(0xFF292D32), width: 1.5),
                ),
              ),
              Text(
                'Everything in single click',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000),
                ),
              ),
              SizedBox(height: height * .018),
              Text(
                'Add, genreate, store, transfer, sync, export & copy all your passwords in single click. Use autofill for quick action without opening app.',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF000000),
                ),
              ),
              Spacer(),
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
                      MaterialPageRoute(builder: (context)=>ThirdIntroductionScreen()));
                },
              ),
              SizedBox(height: height * .025),
              CustomButton(
                onTap: () {},
                string: Text(
                  'Already have an account',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: height*.025,)
            ],
          ),
        ),
      ),
    );
  }
}
