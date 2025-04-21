import 'package:flutter/cupertino.dart';

class Rectangle extends StatelessWidget {
  final Color? color;
   const Rectangle({super.key,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.25,
      height: MediaQuery.of(context).size.height*.012,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(47),
        color: color,
        border: Border.all(
          color: Color(0xFF292D32),
        width: 1
        )
      ),
    );
  }
}
