import 'package:flutter/material.dart';

class PageViewProvider extends ChangeNotifier {
  PageController pageController = PageController();

  void changePage(int page) {
    pageController.jumpToPage(page);
    notifyListeners();
  }
}
