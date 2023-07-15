import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/utils/ui/functions/data/data_service.dart';

import '../auth/user_model.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");
  @override
  Widget build(BuildContext context) {
    final data = DataService().getUsers();
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<UserModel>?>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(("Hata ${snapshot.error}"));
            } else if (snapshot.hasData) {
              final userList = snapshot.data;
              return ListView.builder(
                itemCount: userList!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      userList[index].username ?? "Kullanici Bilgisi Yok",
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text("Veri Bulunamadi"));
            }
          },
        ),
      ),
    );
  }
}
