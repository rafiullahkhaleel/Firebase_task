import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewRecord extends StatefulWidget {
  const NewRecord({super.key});

  @override
  State<NewRecord> createState() => _NewRecordState();
}

class _NewRecordState extends State<NewRecord> {
  bool isChecked = false;
  double sliderValue = 4;
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
            Divider(thickness: 2.5, color: Color(0xFFDADADA)),
            SizedBox(height: height * .015),
            Text(
              'Password',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xFF292D32),
              ),
            ),
            SizedBox(height: height * .015),
            TextField(
              decoration: InputDecoration(
                suffixIcon: ImageIcon(AssetImage('assets/refresh-2.png')),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Color(0xFF9B9B9B)),
                ),
              ),
            ),
            SizedBox(height: height * .03),
            Row(
              children: [
                Text(
                  'Length',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF292D32),
                  ),
                ),
                SizedBox(width: width * .14),
                Container(
                  height: height * .04,
                  width: width * .09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Color(0xFFDADADA), width: 2),
                  ),
                  child: Center(
                    child: Text(

                    sliderValue.toInt().toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width * .02),
                Slider(
                    value: sliderValue,
                    activeColor: Color(0xFF105DFB),
                    inactiveColor: Color(0xFF9B9B9B),
                    min: 4,
                    max: 24,
                    onChanged: (value){
                      setState(() {
                        sliderValue = value;
                      });
                    }),
              ],
            ),
            Row(
              children: [
                Text('Numbers',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF292D32),
                  ),
                ),
                SizedBox(width: width * .08),
                Checkbox(
                  activeColor: Color(0xFF105DFB),
                    value: isChecked,
                    onChanged: (value){
                    setState(() {

                    });
                    isChecked = value!;
                    }),
                SizedBox(width: width * .04),
                Text('Symbols',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF292D32),
                  ),
                ),
                SizedBox(width: width * .08),
                Checkbox(
                    activeColor: Color(0xFF105DFB),
                    value: isChecked,
                    onChanged: (value){
                      setState(() {

                      });
                      isChecked = value!;
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
