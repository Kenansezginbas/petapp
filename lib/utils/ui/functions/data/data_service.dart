import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_app/modules/auth/user_model.dart';
import 'package:pet_app/modules/post/post_model.dart';
import 'package:pet_app/utils/enums/service_enums.dart';

class DataService {
  Future<ServiceEnum> addUser(user) async {
    try {
      final users = FirebaseFirestore.instance.collection('Users');
      final result = await users.add(user);
      print(result);
      return ServiceEnum.success;
    } catch (_) {
      return ServiceEnum.error;
    }
  }

  Future<List<UserModel>?>? getUsers() async {
    final userCollection = FirebaseFirestore.instance.collection("Users");
    final querySnapshot = await userCollection.get();
    final List<UserModel> userList = [];
    querySnapshot.docs.forEach((doc) {
      final userData = doc.data();
      final userModel = UserModel.fromJson(userData);
      userList.add(userModel);
    });

    return userList;
  }

  Future<List<PostModel>?>? getPosts() async {
    final postCollection = FirebaseFirestore.instance.collection("Post");
    final querySnapshot = await postCollection.get();
    final List<PostModel> postList = [];
    querySnapshot.docs.forEach((doc) {
      final postData = doc.data();
      final postModel = PostModel.fromJson(postData);
      postList.add(postModel);
    });
    return postList;
  }

  Future<ServiceEnum> addPost(PostModel post) async {
    try {
      final users = FirebaseFirestore.instance.collection('Post');
      final result = await users.add(
        {
          "id": post.id,
          "username": post.username,
          "petName": post.petName,
          "description": post.desc
        },
      );
      return ServiceEnum.success;
    } catch (_) {
      return ServiceEnum.error;
    }
  }
}
