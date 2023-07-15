import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final userCollection = 'Users';

  Future addUser(UserCredential user) async {
    final firebase = FirebaseFirestore.instance.collection(userCollection);
    try {
      final result = await firebase.add({
        "id": user.user!.uid,
        "fullName": user.user!.email,
        "username": user.user!.email,
        "phone": user.user!.email
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
