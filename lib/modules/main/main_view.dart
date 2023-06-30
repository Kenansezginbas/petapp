import 'package:flutter/material.dart';
import 'package:pet_app/modules/main/components/nav_bar_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: null,
      bottomNavigationBar: NavBarView(),
    );
  }
}
