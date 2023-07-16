import 'package:flutter/material.dart';
import 'package:pet_app/config/colors/color_manager.dart';
import 'package:pet_app/config/router/routes_enum.dart';
import 'package:pet_app/utils/ui/components/dialogs/custom_dialog.dart';
import 'package:pet_app/utils/ui/functions/auth/auth_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () async {
              final authService = AuthService();
              final result = await authService.logoutUser();
              if (result) {
                AppNavigator.replaceWith(Routes.signIn);
              } else {
                customDialog(
                    context: context,
                    title: "Hata",
                    content: "Cikis yapilamadi");
              }
            },
            icon: const Icon(
              Icons.logout,
              color: ColorManager.blackColor,
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
