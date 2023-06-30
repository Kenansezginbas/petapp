import 'package:flutter/material.dart';
import 'package:pet_app/provider/nav_bar_provider.dart';
import 'package:provider/provider.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.watch<NavBarProvider>().navBarCurrentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
      ],
      onTap: (value) {
        context.read<NavBarProvider>().changeCurrentIndex(value);
      },
    );
  }
}
