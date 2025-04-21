import 'package:task/view/screens/introduction_screens/second_introduction_screen.dart';
import 'package:task/view/widgets/custom_button.dart';
import 'package:task/view/widgets/rectangle_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstIntroductionScreen extends StatefulWidget {
  const FirstIntroductionScreen({super.key});

  @override
  State<FirstIntroductionScreen> createState() =>
      _FirstIntroductionScreenState();
}

class _FirstIntroductionScreenState extends State<FirstIntroductionScreen> {
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
                  Rectangle(),
                  Rectangle(),
                ],
              ),
              SizedBox(height: height * .07),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/shield-tick.png',
                  height: height * .281,
                  width: width * .5,
                ),
              ),
              SizedBox(height: height * .075),
              Text(
                'Security',
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
                'Control your security',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000),
                ),
              ),
              SizedBox(height: height * .018),
              Text(
                'This application is build on blockchain so that you can get 100% security across websites & applications with single app.',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondIntroductionScreen(),
                    ),
                  );
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
