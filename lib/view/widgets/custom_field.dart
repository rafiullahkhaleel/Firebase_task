import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField extends StatelessWidget {
  final ImageIcon? suffixIcon;
  final ValueChanged? onChanged;
  final TextEditingController controller;
  final String hintText;
  final OutlineInputBorder? border;
  final String? validationText;
  const CustomField({
    super.key,
    required this.controller,
    required this.hintText,
    this.border,
    this.validationText, this.onChanged, this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        border: border,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.w300,
        fontSize: 16,
        color: Color(0xFF808080),
      ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationText;
        } else {
          return null;
        }
      },
    );
  }
}
