import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height*.06,),
              Image.asset(
                'assets/Frame 2.png',
                height: height * .1,
                width: width * .2,
              ),
              Text(
                'Passblock',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 34,
                  color: Color(0xFF292D32),
                ),
              ),
              Text(
                'Frictionless Security',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Color(0xFF000000),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 19,vertical: 28),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF292D32),width: 2),
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: height*.015,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.2,horizontal: 9),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFF000000),width: 1),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              height: height*.045,
                              width: width*.35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0xFF292D32)
                              ),
                              child: Center(
                                child: Text('Register',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Color(0xFFFFFFFF)
                                ),
                                ),
                              ),
                            ),
                            SizedBox(width: width*.23,),
                            SizedBox(
                              height: height*.045,
                              child: Center(
                                child: Text('Login',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: Color(0xFF292D32)
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Text('Personal details',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Color(0xFF292D32)
                    ),
                    ),
                    SizedBox(
                      height: height*.07,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'First name',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9B9B9B)
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),

                          )
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
