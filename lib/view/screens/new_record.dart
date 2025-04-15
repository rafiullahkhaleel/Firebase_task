import 'package:flutter/cupertino.dart';
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
        padding: EdgeInsets.only(
          left: width * .07,
          right: width * .07,
          top: height * .05,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: height * .03),
                    Text(
                      'Name',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF292D32),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: width * .15),
                SizedBox(
                  width: width * .44,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'website or app name',
                      hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Color(0xFF808080),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width * .05),
                Column(
                  children: [
                    SizedBox(height: height * .02),
                    ImageIcon(AssetImage('assets/tick-circle.png')),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: height * .03),
                    Text(
                      'User id',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF292D32),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: width * .135),
                SizedBox(
                  width: width * .44,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'username or email id',
                      hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Color(0xFF808080),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width * .05),
                Column(
                  children: [
                    SizedBox(height: height * .02),
                    ImageIcon(AssetImage('assets/tick-circle.png')),
                  ],
                ),
              ],
            ),
            SizedBox(height: height * .035),
            Divider(thickness: 2.5,color: Color(0xFFDADADA),),
            SizedBox(height: height * .015),
            Text('Password',style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xFF292D32)
            ),),
            SizedBox(height: height * .015),
            TextField(
              decoration: InputDecoration(
                suffixIcon: ImageIcon(
                  AssetImage('assets/refresh-2.png')
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Color(0xFF9B9B9B))
                )
                    
              ),
            )
          ],
        ),
      ),
    );
  }
}
