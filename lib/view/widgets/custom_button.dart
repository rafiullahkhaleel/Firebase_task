import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 final Widget string;
 final Color? color;
 final GestureTapCallback onTap;
  const CustomButton({super.key,required this.string,this.color,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height*.07,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF292D32),
            width: 2,
          ),
          color: color,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: string,),
      ),
    );
  }
}
