import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String businessName;

  UserProvider({this.businessName = "My Hostel"});

  void changeBusinessName({required String newBusinessName}) async {
    businessName = newBusinessName;
    notifyListeners();
  }
}
