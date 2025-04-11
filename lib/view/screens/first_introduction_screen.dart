import 'package:firebase_task/view/widgets/rectangle_widget.dart';
import 'package:flutter/material.dart';

class FirstIntroductionScreen extends StatefulWidget {
  const FirstIntroductionScreen({super.key});

  @override
  State<FirstIntroductionScreen> createState() => _FirstIntroductionScreenState();
}

class _FirstIntroductionScreenState extends State<FirstIntroductionScreen> {
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: height*.1,
          ),
          Rectangle(
            color: Color(0xFF292D32),
          ),
          Rectangle()
        ],
      ),
      ),
    );
  }
}
