import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final firebase = FirebaseAuth.instance;
  Future<UserCredential?> signUpUser(
      {required String email, required String password}) async {
    try {
      final userResult = await firebase.createUserWithEmailAndPassword(
          email: email, password: password);

      return userResult;
    } on FirebaseAuthException catch (_) {}
    return null;
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
