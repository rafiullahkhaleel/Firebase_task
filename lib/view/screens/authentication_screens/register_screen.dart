import 'package:task/services/auth_service.dart';
import 'package:task/view/screens/authentication_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthService authService = AuthService();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  final RegExp phoneNumber = RegExp(
    r'^(?:\+?[0-9]{1,3})?[0]?[1-9][0-9]{8,13}$',
  );

  bool isButtonEnabled = false;

  void checkFields() {
    setState(() {
      isButtonEnabled =
          firstNameController.text.trim().length >= 3 &&
              lastNameController.text.trim().length >= 3 &&
              phoneNumber.hasMatch(mobileController.text.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * .03),
              Center(
                child: Column(
                  children: [
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
                  ],
                ),
              ),
              SizedBox(height: height * .04),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 20),
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
                      padding: const EdgeInsets.symmetric(vertical: 8.2, horizontal: 9),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFF000000), width: 1),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: height * .045,
                            width: width * .35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color(0xFF292D32),
                            ),
                            child: Center(
                              child: Text(
                                'Register',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * .2),
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>LoginScreen()));
                            },
                            child: Text(
                              'Login',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: const Color(0xFF292D32),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Personal details',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: const Color(0xFF292D32),
                      ),
                    ),
                    SizedBox(
                      height: height*.065,
                      child: TextField(
                        controller: firstNameController,
                        onChanged: (_) => checkFields(),
                        decoration: InputDecoration(
                          hintText: 'First name',
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
                    SizedBox(
                      height: height*.065,
                      child: TextField(
                        controller: lastNameController,
                        onChanged: (_) => checkFields(),
                        decoration: InputDecoration(
                          hintText: 'Last name',
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
                    SizedBox(
                      height: height*.065,
                      child: TextField(
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
            ],
          ),
        ),
      ),

      // ✅ Bottom Button always stays fixed at the bottom
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20,right: 20,bottom: height * .02),
        child: InkWell(
          onTap: isButtonEnabled ? () {
            authService.phoneAuthentication(mobileController.text.trim().toString(), context);
          } : null,
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
      ),
    );
  }



}


















// import 'package:task/view/screens/otp_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//
//   final RegExp phoneNumber = RegExp(
//     r'^(?:\+?[0-9]{1,3})?[0]?[1-9][0-9]{8,13}$',
//   );
//
//   bool isButtonEnabled = false;
//
//   void checkFields() {
//     setState(() {
//       isButtonEnabled =
//           firstNameController.text.trim().length >= 3 &&
//           lastNameController.text.trim().length >= 3 &&
//           phoneNumber.hasMatch(mobileController.text.trim());
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.sizeOf(context).height;
//     final width = MediaQuery.sizeOf(context).width;
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: height * .06),
//               Image.asset(
//                 'assets/Frame 2.png',
//                 height: height * .1,
//                 width: width * .2,
//               ),
//               Text(
//                 'Passblock',
//                 style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 34,
//                   color: Color(0xFF292D32),
//                 ),
//               ),
//               Text(
//                 'Frictionless Security',
//                 style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 18,
//                   color: Color(0xFF000000),
//                 ),
//               ),
//               SizedBox(height: height * .04),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 19, vertical: 28),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Color(0xFF292D32), width: 2),
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   spacing: height * .015,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(
//                         vertical: 8.2,
//                         horizontal: 9,
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Color(0xFF000000), width: 1),
//                       ),
//                       child: Center(
//                         child: Row(
//                           children: [
//                             InkWell(
//                               onTap: (){
//                                 Navigator.push(context,
//                                     MaterialPageRoute(builder: (context)=>OtpScreen()));
//                               },
//                               child: Container(
//                                 height: height * .042,
//                                 width: width * .35,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(7),
//                                   color: Color(0xFF292D32),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     'Register',
//                                     style: GoogleFonts.poppins(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 18,
//                                       color: Color(0xFFFFFFFF),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: width * .2),
//                             SizedBox(
//                               height: height * .045,
//                               child: Center(
//                                 child: Text(
//                                   'Login',
//                                   style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 18,
//                                     color: Color(0xFF292D32),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Text(
//                       'Personal details',
//                       style: GoogleFonts.poppins(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 20,
//                         color: Color(0xFF292D32),
//                       ),
//                     ),
//                     SizedBox(
//                       height: height * .065,
//                       child: TextField(
//                         controller: firstNameController,
//                         onChanged: (value) {
//                           return checkFields();
//                         },
//                         decoration: InputDecoration(
//                           hintText: 'First name',
//                           hintStyle: GoogleFonts.poppins(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xFF9B9B9B),
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: height * .065,
//                       child: TextField(
//                         controller: lastNameController,
//                         onChanged: (value) => checkFields(),
//                         decoration: InputDecoration(
//                           hintText: 'Last name',
//                           hintStyle: GoogleFonts.poppins(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xFF9B9B9B),
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: height * .065,
//                       child: TextField(
//                         controller: mobileController,
//                         onChanged: (value) => checkFields(),
//                         decoration: InputDecoration(
//                           hintText: 'Mobile no.',
//                           hintStyle: GoogleFonts.poppins(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xFF9B9B9B),
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Spacer(),
//               InkWell(
//                 onTap: isButtonEnabled ? () {} : null,
//                 child: Container(
//                   margin: EdgeInsets.symmetric(horizontal: 17),
//                   height: height * .07,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Color(0xFF9B9B9B), width: 1),
//                     borderRadius: BorderRadius.circular(10),
//                     color:
//                         isButtonEnabled
//                             ? Color(0xFF292D32)
//                             : Colors.transparent,
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Get verification code',
//                       style: GoogleFonts.poppins(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 20,
//                         color:
//                             isButtonEnabled
//                                 ? Color(0xFFFFFFFF)
//                                 : Color(0xFF9B9B9B),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: height * .02),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
