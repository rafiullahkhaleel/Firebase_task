import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task/view/screens/new_record.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/view/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(width: width * .05),
            Expanded(child: Icon(Icons.perm_identity_outlined, size: 35)),
          ],
        ),
        title: Text(
          'Passwords',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            color: Color(0xFF000000),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewRecord()),
              );
            },
            icon: Icon(Icons.add, size: 35),
          ),
          SizedBox(width: width * .045),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('userData').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('ERROR OCCURRED ${snapshot.error}'));
          } else if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No Data Available'));
          } else {
            // All documents
            final allDocs = snapshot.data!.docs;

            // Grouping by categories
            final workList =
                allDocs.where((doc) => doc['category'] == 'Work').toList();
            final educationList =
                allDocs.where((doc) => doc['category'] == 'Education').toList();
            final healthList =
                allDocs.where((doc) => doc['category'] == 'Health').toList();
            final entertainmentList =
            allDocs.where((doc) => doc['category'] == 'Entertainment').toList();
            final shoppingList =
            allDocs.where((doc) => doc['category'] == 'Shopping').toList();
            final otherList =
            allDocs.where((doc) => doc['category'] == 'Other').toList();

            return ListView(
              padding: EdgeInsets.all(16),
              children: [
                if (workList.isNotEmpty) ...[
                  TextWidget(text: 'Work'),
                  ...workList.map(
                    (doc) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xFF12100E),
                            radius: 30,
                            child: Text(
                              doc['platformName'].isNotEmpty
                                  ? doc['platformName'][0]
                                  : '',
                              style: GoogleFonts.alfaSlabOne(
                                color: Color(0xFFFFFFFF),
                                fontSize: 30,
                              ),
                            ),
                          ),
                          title: TextWidget(text: doc['platformName']),
                          subtitle: Text(
                            doc['emailName'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color: Color(0xFF808080),
                            ),
                          ),
                          trailing: Icon(Icons.copy_outlined),
                        ),
                        SizedBox(height: height * .015),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                ],
                if (educationList.isNotEmpty) ...[
                  TextWidget(text: 'Education'),
                  ...educationList.map(
                    (doc) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xFF12100E),
                            radius: 30,
                            child: Text(
                              doc['platformName'].isNotEmpty
                                  ? doc['platformName'][0]
                                  : '',
                              style: GoogleFonts.alfaSlabOne(
                                color: Color(0xFFFFFFFF),
                                fontSize: 30,
                              ),
                            ),
                          ),
                          title: TextWidget(text: doc['platformName']),
                          subtitle: Text(
                            doc['emailName'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color: Color(0xFF808080),
                            ),
                          ),
                          trailing: Icon(Icons.copy_outlined),
                        ),
                        SizedBox(height: height * .015),
                      ],
                    ),
                  ),
                ],
                if (healthList.isNotEmpty) ...[
                  TextWidget(text: 'Health'),
                  ...healthList.map(
                        (doc) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xFF12100E),
                            radius: 30,
                            child: Text(
                              doc['platformName'].isNotEmpty
                                  ? doc['platformName'][0]
                                  : '',
                              style: GoogleFonts.alfaSlabOne(
                                color: Color(0xFFFFFFFF),
                                fontSize: 30,
                              ),
                            ),
                          ),
                          title: TextWidget(text: doc['platformName']),
                          subtitle: Text(
                            doc['emailName'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color: Color(0xFF808080),
                            ),
                          ),
                          trailing: Icon(Icons.copy_outlined),
                        ),
                        SizedBox(height: height * .015),
                      ],
                    ),
                  ),
                ],
                if (entertainmentList.isNotEmpty) ...[
                  TextWidget(text: 'Entertainment'),
                  ...entertainmentList.map(
                        (doc) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xFF12100E),
                            radius: 30,
                            child: Text(
                              doc['platformName'].isNotEmpty
                                  ? doc['platformName'][0]
                                  : '',
                              style: GoogleFonts.alfaSlabOne(
                                color: Color(0xFFFFFFFF),
                                fontSize: 30,
                              ),
                            ),
                          ),
                          title: TextWidget(text: doc['platformName']),
                          subtitle: Text(
                            doc['emailName'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color: Color(0xFF808080),
                            ),
                          ),
                          trailing: Icon(Icons.copy_outlined),
                        ),
                        SizedBox(height: height * .015),
                      ],
                    ),
                  ),
                ],
                if (shoppingList.isNotEmpty) ...[
                  TextWidget(text: 'Shopping'),
                  ...shoppingList.map(
                        (doc) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xFF12100E),
                            radius: 30,
                            child: Text(
                              doc['platformName'].isNotEmpty
                                  ? doc['platformName'][0]
                                  : '',
                              style: GoogleFonts.alfaSlabOne(
                                color: Color(0xFFFFFFFF),
                                fontSize: 30,
                              ),
                            ),
                          ),
                          title: TextWidget(text: doc['platformName']),
                          subtitle: Text(
                            doc['emailName'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color: Color(0xFF808080),
                            ),
                          ),
                          trailing: Icon(Icons.copy_outlined),
                        ),
                        SizedBox(height: height * .015),
                      ],
                    ),
                  ),
                ],
                if (otherList.isNotEmpty) ...[
                  TextWidget(text: 'Other'),
                  ...otherList.map(
                        (doc) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xFF12100E),
                            radius: 30,
                            child: Text(
                              doc['platformName'].isNotEmpty
                                  ? doc['platformName'][0]
                                  : '',
                              style: GoogleFonts.alfaSlabOne(
                                color: Color(0xFFFFFFFF),
                                fontSize: 30,
                              ),
                            ),
                          ),
                          title: TextWidget(text: doc['platformName']),
                          subtitle: Text(
                            doc['emailName'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color: Color(0xFF808080),
                            ),
                          ),
                          trailing: Icon(Icons.copy_outlined),
                        ),
                        SizedBox(height: height * .015),
                      ],
                    ),
                  ),
                ],
              ],
            );
          }
        },
      ),
    );
  }
}
