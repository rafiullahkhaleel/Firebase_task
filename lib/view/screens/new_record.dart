import 'package:provider/provider.dart';
import 'package:task/provider/new_record_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/view/widgets/custom_field.dart';

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
    return Consumer<NewRecordProvider>(
      builder: (context, provider, child) {
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
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: width * .06,
                right: width * .06,
                top: height * .025,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: height * .03),
                          MyText(label: 'Name'),
                        ],
                      ),
                      SizedBox(width: width * .1),
                      SizedBox(
                        width: width * .44,
                        child: CustomField(
                          controller: provider.nameController,
                          hintText: 'website or app name',
                          onChanged: (val) {
                            provider.field1();
                            provider.checkedField();
                            provider.colorChange();
                          },
                        ),
                      ),
                      SizedBox(width: width * .05),
                      Column(
                        children: [
                          SizedBox(height: height * .02),
                          ImageIcon(
                            AssetImage('assets/tick-circle.png'),
                            color:
                                provider.field1()
                                    ? Color(0xFF1ED760)
                                    : Color(0xFF9B9B9B),
                          ),
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
                          MyText(label: 'User id'),
                        ],
                      ),
                      SizedBox(width: width * .085),
                      SizedBox(
                        width: width * .44,
                        child: CustomField(
                          controller: provider.emailController,
                          hintText: 'username or email id',
                          onChanged: (val) {
                            provider.field2();
                            provider.checkedField();
                            provider.colorChange();
                          },
                        ),
                      ),
                      SizedBox(width: width * .05),
                      Column(
                        children: [
                          SizedBox(height: height * .02),
                          ImageIcon(
                            AssetImage('assets/tick-circle.png'),
                            color:
                                provider.field2()
                                    ? Color(0xFF1ED760)
                                    : Color(0xFF9B9B9B),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * .035),
                  Row(
                    children: [
                      MyText(label: 'Category'),
                      SizedBox(width: width * .1),
                      DropdownButton<String>(
                        icon: Icon(Icons.arrow_drop_down_outlined, size: 50),
                        value: provider.selectedOption,
                        items: [
                          DropdownMenuItem<String>(
                            value: 'Education',
                            child: Text('Education'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Health',
                            child: Text('Health'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Entertainment',
                            child: Text('Entertainment'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Work',
                            child: Text('Work'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Shopping',
                            child: Text('Shopping'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Other',
                            child: Text('Other'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            provider.selectedOption = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: height * .035),
                  Divider(thickness: 2.5, color: Color(0xFFDADADA)),
                  SizedBox(height: height * .015),
                  MyText(label: 'Password'),
                  SizedBox(height: height * .015),
                  Stack(
                    children: [
                      CustomField(
                        controller: provider.passwordController,
                        hintText: '',
                        onChanged: (v) {
                          provider.field3();
                          provider.checkedField();
                          provider.colorChange();
                        },
                        suffixIcon: ImageIcon(
                          AssetImage('assets/refresh-2.png'),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color(0xFF9B9B9B)),
                        ),
                      ),
                      Positioned(
                        left: 3,
                        right: 3,
                        bottom: 2,
                        child: Container(height: 5, color: Color(0xFFDADADA)),
                      ),
                      Visibility(
                        visible: provider.field3(),
                        child: Positioned(
                          left: 3,
                          bottom: 2,
                          child: Container(
                            height: 5,
                            width: width * .7,
                            color: Color(0xFF1ED760),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * .03),
                  Row(
                    children: [
                      MyText(label: 'Length'),
                      Spacer(),
                      Container(
                        height: height * .035,
                        width: width * .075,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Color(0xFFDADADA),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            provider.sliderValue.toInt().toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * .45,
                        child: Slider(
                          value: provider.sliderValue,
                          activeColor: Color(0xFF105DFB),
                          inactiveColor: Color(0xFF9B9B9B),
                          min: 4,
                          max: 24,
                          onChanged: (value) {
                            provider.sliderValue = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyText(label: 'Numbers'),
                      SizedBox(width: width * .045),
                      Checkbox(
                        activeColor: Color(0xFF105DFB),
                        value: provider.isCheckedNumbers,
                        onChanged: (value) {
                          provider.isCheckedNumbers = value!;
                        },
                      ),
                      MyText(label: 'Symbols'),
                      Spacer(),
                      Checkbox(
                        activeColor: Color(0xFF105DFB),
                        value: provider.isCheckedSymbols,
                        onChanged: (value) {
                          provider.isCheckedSymbols = value!;
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyText(label: 'Lowercase'),
                      // Spacer(),
                      Checkbox(
                        activeColor: Color(0xFF105DFB),
                        value: provider.isCheckedLowerCase,
                        onChanged: (value) {
                          provider.isCheckedLowerCase = value!;
                        },
                      ),
                      MyText(label: 'Uppercase'),
                      // Spacer(),
                      Checkbox(
                        activeColor: Color(0xFF105DFB),
                        value: provider.isCheckedUpperCase,
                        onChanged: (value) {
                          provider.isCheckedUpperCase = value!;
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: height * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          provider.password();
                        },
                        child: Container(
                          height: height * .065,
                          width: width * .42,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFDADADA),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Regenerate',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF333333),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap:
                            provider.checkedField()
                                ? () {
                                  provider.savePassword(context);
                                }
                                : () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Fill all fields')),
                                  );
                                },
                        child: Container(
                          height: height * .065,
                          width: width * .42,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFDADADA),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child:
                                provider.isLoading
                                    ? CircularProgressIndicator(
                                      color: Color(0xFF333333),
                                    )
                                    : Text(
                                      'Save password',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Color(0xFF333333),
                                      ),
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * .02),
                  Text(
                    'OR',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Container(
                    height: height * .065,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFDADADA), width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Add manually',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * .015),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyText extends StatelessWidget {
  final String label;
  const MyText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Color(0xFF292D32),
      ),
    );
  }
}
