import 'package:flutter/material.dart';
import 'package:pet_app/modules/home/components/post_widget.dart';
import 'package:pet_app/modules/post/post_model.dart';

import '../../utils/ui/functions/data/data_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final data = DataService().getPosts();
    return Scaffold(
      body: FutureBuilder<List<PostModel>?>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text(("Hata ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final postList = snapshot.data;
            return ListView.builder(
              itemCount: postList!.length,
              itemBuilder: (context, index) {
                return PostWidget(
                  post: PostModel(
                      username: postList[index].username,
                      desc: postList[index].desc),
                );
              },
            );
          } else {
            return const Center(child: Text("Veri Bulunamadi"));
          }
        },
      ),
    );
  }
}
