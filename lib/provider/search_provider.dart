import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  String _searchText = '';
  List<DocumentSnapshot> _filteredDocs = [];
  bool _isLoading = false;
  String? _error;

  String get searchText => _searchText.toLowerCase();
  List<DocumentSnapshot> get filteredDocs => _filteredDocs;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void updateSearchText(String text) {
    _searchText = text;
    _fetchAndFilterData();
    notifyListeners();
  }

  Future<void> _fetchAndFilterData() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final snapshot =
      await FirebaseFirestore.instance.collection('userData').get();

      final allDocs = snapshot.docs;

      _filteredDocs = allDocs.where((doc) {
        final platformName = doc['platformName'].toString().toLowerCase();
        return platformName.contains(_searchText);
      }).toList();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
