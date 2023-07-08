import 'package:flutter/material.dart';
import 'package:pet_app/config/router/routes_enum.dart';
import 'package:pet_app/utils/ui/components/buttons/custom_icon_button.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomIconButton(
            onPressed: () {
              AppNavigator.replaceWith(Routes.signIn);
            },
            icondata: Icons.send),
      ),
    );
  }
}
