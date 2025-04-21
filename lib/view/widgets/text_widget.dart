import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  const TextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,fontSize: 20,color: Color(0xFF000000)
    ),);
  }
}
