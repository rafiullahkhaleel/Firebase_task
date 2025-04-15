import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewRecord extends StatefulWidget {
  const NewRecord({super.key});

  @override
  State<NewRecord> createState() => _NewRecordState();
}

class _NewRecordState extends State<NewRecord> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New record',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            color: Color(0xFF000000),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*.07),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: height*.03,),
                    Text('Name',style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF292D32)
                    ),),
                  ],
                ),
                SizedBox(width: width*.15,),
                SizedBox(
                  width: width*.44,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'website or app name',
                        hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Color(0xFF808080)
                        )
                      ),
                    )),

              ],
            )
          ],
        ),
      ),
    );
  }
}
