import 'package:flutter/material.dart';

class FindPasswordModel extends ChangeNotifier {
  String email = '';

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }
}
