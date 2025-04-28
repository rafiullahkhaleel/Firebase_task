import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;
  final String name;
  const MyCustomButton({
    super.key,
    required this.onTap,
    this.isLoading = false,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .07,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,
        ),
        child: Center(
          child:
          isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}