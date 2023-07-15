import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_app/utils/enums/service_enums.dart';
import 'package:pet_app/utils/ui/functions/auth/add_user_service.dart';
import 'package:pet_app/utils/ui/functions/data/data_service.dart';
import 'package:uuid/uuid.dart';

class AuthService {
  final firebase = FirebaseAuth.instance;
  final userService = UserService();
  final DataService dataService = DataService();
  final uid = const Uuid();
  var resultD;
  Future<dynamic> signUpUser(
      {required String email, required String password}) async {
    try {
      final userResult = await firebase.createUserWithEmailAndPassword(
          email: email, password: password);
      final result = await userService.addUser(userResult);
      try {
        final userData = await dataService.addUser({
          "id": uid.v4(),
          "username": userResult.user!.email,
          "fullname": userResult.user!.email,
          "phone": userResult.user!.email
        });
        resultD = ServiceEnum.success;
      } on FirebaseAuthException catch (e) {
        print(e.toString());
        resultD = e.code;
      }

      // return userResult;
    } on FirebaseAuthException catch (e) {
      resultD = e.code;
    }
    return resultD;
  }

  Future<UserCredential?> signInUser(
      {required String email, required String password}) async {
    try {
      final userResult = await firebase.signInWithEmailAndPassword(
          email: email, password: password);
      return userResult;
    } on FirebaseAuthException catch (_) {}
    return null;
  }
}
