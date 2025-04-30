import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final OutlineInputBorder? border;
  final String? validationText;
  const CustomField({
    super.key,
    required this.controller,
    required this.hintText,
    this.border,
    this.validationText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: border,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black45),
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
