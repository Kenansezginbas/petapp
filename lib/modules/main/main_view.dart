import 'package:flutter/material.dart';
import 'package:pet_app/modules/home/home_view.dart';
import 'package:pet_app/modules/main/components/nav_bar_view.dart';
import 'package:pet_app/modules/profile/profile_view.dart';
import 'package:pet_app/provider/auth/current_user_provider.dart';
import 'package:pet_app/provider/page_view_provider.dart';
import 'package:pet_app/utils/ui/material/custom_app_bar.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<CurrentUserProvider>().user.username;
    return Scaffold(
      appBar: CustomAppBar(title: "User $user"),
      body: PageView(
        controller: context.watch<PageViewProvider>().pageController,
        children: const [
          HomeView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: const NavBarView(),
    );
  }
}
