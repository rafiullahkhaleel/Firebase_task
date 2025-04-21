import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  TextEditingController mobileController = TextEditingController();

  final RegExp phoneNumber = RegExp(
    r'^(?:\+?[0-9]{1,3})?[0]?[1-9][0-9]{8,13}$',
  );

  bool isButtonEnabled = false;

  void checkFields() {
    setState(() {
      isButtonEnabled = phoneNumber.hasMatch(mobileController.text.trim());
    });
  }

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
              SizedBox(height: height * .05),
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
                  color: const Color(0xFF292D32),
                ),
              ),
              Text(
                'Frictionless Security',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: const Color(0xFF000000),
                ),
              ),
              SizedBox(height: height * .04),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 19,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF292D32), width: 2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: height * .015,
                  children: [
                    // Register/Login row
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.2,
                        horizontal: 9,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFF000000),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Register',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: const Color(0xFF292D32),
                              ),
                            ),
                          ),
                          SizedBox(width: width * .2),
                          Container(
                            height: height * .045,
                            width: width * .35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color(0xFF292D32),
                            ),
                            child: Center(
                              child: Text(
                                'Login',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Enter mobile no',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: const Color(0xFF292D32),
                      ),
                    ),
                    SizedBox(
                      height: height * .065,
                      child: TextField(
                        onTapOutside: (e) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        controller: mobileController,
                        keyboardType: TextInputType.phone,
                        onChanged: (_) => checkFields(),
                        decoration: InputDecoration(
                          hintText: 'Mobile no.',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF9B9B9B),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: isButtonEnabled ? () {} : null,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  height: height * .07,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF9B9B9B), width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color:
                        isButtonEnabled
                            ? Color(0xFF292D32)
                            : Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      'Get verification code',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color:
                            isButtonEnabled
                                ? Color(0xFFFFFFFF)
                                : Color(0xFF9B9B9B),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * .02),
            ],
          ),
        ),
      ),
    );
  }
}
