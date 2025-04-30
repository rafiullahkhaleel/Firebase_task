import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../provider/search_provider.dart';
import '../widgets/text_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, provider, _) {
        final width = MediaQuery.sizeOf(context).width;
        final height = MediaQuery.sizeOf(context).height;

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                SizedBox(height: height * .07),
                TextField(
                  onChanged: (value) {
                    provider.updateSearchText(value);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF2F2F2),
                    border: OutlineInputBorder(),
                    hintText: "Search by platform name...",
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: () {
                    if (provider.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (provider.error != null) {
                      return Center(child: Text('ERROR: ${provider.error}'));
                    } else if (provider.filteredDocs.isEmpty) {
                      return Center(child: Text('No match found.'));
                    }

                    return ListView.builder(
                      itemCount: provider.filteredDocs.length,
                      itemBuilder: (context, index) {
                        final data = provider.filteredDocs[index];
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xFF12100E),
                            child: Text(
                              data['platformName'].isNotEmpty
                                  ? data['platformName'][0]
                                  : '',
                              style: GoogleFonts.alfaSlabOne(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          title: TextWidget(text: data['platformName']),
                          subtitle: Text(
                            data['emailName'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color: Color(0xFF808080),
                            ),
                          ),
                          trailing: Icon(Icons.copy_outlined),
                        );
                      },
                    );
                  }(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../widgets/text_widget.dart';
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   TextEditingController searchController = TextEditingController();
//   String searchText = '';
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 22),
//         child: Column(
//           children: [
//             SizedBox(height: height * .07),
//             TextField(
//               controller: searchController,
//               onChanged: (value) {
//                 setState(() {
//                   searchText = value.toLowerCase();
//                 });
//               },
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Color(0xFFF2F2F2),
//                 border: OutlineInputBorder(),
//                 hintText: "Search by platform name...",
//               ),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: StreamBuilder(
//                 stream:
//                     FirebaseFirestore.instance
//                         .collection('userData')
//                         .snapshots(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(
//                       child: Text('ERROR OCCURRED : ${snapshot.error}'),
//                     );
//                   } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                     return Center(child: Text('No Data Available'));
//                   } else {
//                     final docs = snapshot.data!.docs;
//
//                     final filteredDocs =
//                         docs.where((doc) {
//                           return doc['platformName']
//                               .toString()
//                               .toLowerCase()
//                               .contains(searchText);
//                         }).toList();
//
//                     if (filteredDocs.isEmpty) {
//                       return Center(child: Text('No match found.'));
//                     }
//                     return ListView.builder(
//                       itemCount: filteredDocs.length,
//                       itemBuilder: (context, index) {
//                         final data = filteredDocs[index];
//                         return ListTile(
//                           leading: CircleAvatar(
//                             radius: 30,
//                             backgroundColor: Color(0xFF12100E),
//                             child: Text(
//                               data['platformName'].isNotEmpty
//                                   ? data['platformName'][0]
//                                   : '',
//                               style: GoogleFonts.alfaSlabOne(
//                                 color: Color(0xFFFFFFFF),
//                                 fontSize: 30,
//                               ),
//                             ),
//                           ),
//                           title: TextWidget(text: data['platformName']),
//                           subtitle: Text(
//                             data['emailName'],
//                             style: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 16,
//                               color: Color(0xFF808080),
//                             ),
//                           ),
//                           trailing: Icon(Icons.copy_outlined),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
