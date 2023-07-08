import 'package:flutter/material.dart';
import 'package:pet_app/modules/auth/user_model.dart';

class CurrentUserProvider extends ChangeNotifier {
  UserModel user = UserModel();

  void changeUser(UserModel currentUser) {
    user = currentUser;
    notifyListeners();
  }
}
