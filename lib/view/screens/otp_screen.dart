import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * .06),
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
                SizedBox(height: height * .04),
                Container(
                  padding: EdgeInsets.only(left: 15, top: 28,right: 15,bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF292D32), width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    spacing: height*.015,
                    children: [
                      Text(
                        'Enter verification code',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF292D32),
                        ),
                      ),
                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        controller: otpController,
                        keyboardType: TextInputType.number,
                        autoDismissKeyboard: true,
                        onChanged: (value) {
                          setState(() {});
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: height*.055,
                          fieldWidth: width*.12,
                          activeFillColor: Color(0xFF9B9B9B),
                          inactiveFillColor: Color(0xFF9B9B9B),
                          selectedFillColor: Color(0xFF9B9B9B),
                          activeColor: Color(0xFF9B9B9B),
                          inactiveColor: Color(0xFF9B9B9B),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
