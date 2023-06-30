import 'package:flutter/material.dart';

class NavBarProvider extends ChangeNotifier {
  int navBarCurrentIndex = 0;

  void changeCurrentIndex(int index) {
    navBarCurrentIndex = index;
    notifyListeners();
  }
}
