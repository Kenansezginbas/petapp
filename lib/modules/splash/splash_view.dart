import 'package:flutter/material.dart';
import 'package:pet_app/config/router/routes_enum.dart';
import 'package:pet_app/utils/ui/components/buttons/custom_icon_button.dart';
import 'package:pet_app/utils/ui/functions/auth/auth_service.dart';
import 'package:provider/provider.dart';

import '../../provider/auth/current_user_provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentUser();
  }

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

  currentUser() async {
    final user = await AuthService().currentUser();
    if (user != null) {
      context.read<CurrentUserProvider>().changeUser(user);
      AppNavigator.replaceWith(Routes.main);
    } else {
      AppNavigator.replaceWith(Routes.signIn);
    }
  }
}
