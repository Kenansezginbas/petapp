import 'package:flutter/material.dart';
import 'package:pet_app/config/router/routes_enum.dart';
import 'package:pet_app/modules/auth/components/logo_view.dart';
import 'package:pet_app/modules/auth/user_model.dart';
import 'package:pet_app/provider/auth/current_user_provider.dart';
import 'package:pet_app/utils/ui/components/buttons/custom_elevated_button.dart';
import 'package:pet_app/utils/ui/components/buttons/custom_text_button.dart';
import 'package:pet_app/utils/ui/components/dialogs/custom_dialog.dart';
import 'package:pet_app/utils/ui/components/inputs/custom_text_field.dart';
import 'package:pet_app/utils/ui/functions/auth/auth_service.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _usernameText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: Sizes.s150),
            const LogoView(),
            const Text("Hoşgeldiniz, Lutfen Giris Yapiniz"),
            CustomTextField(
              hintText: "Kullanici Adi",
              textEditingController: _usernameText,
              textInputType: TextInputType.emailAddress,
            ),
            CustomTextField(
              hintText: "Sifre",
              textEditingController: _passwordText,
            ),
            CustomElevatedButton(
                onPressed: validateInputs, buttonTitle: "Giris Yap"),
            CustomTextButton(
                onPressed: () => AppNavigator.replaceWith(Routes.signUp),
                buttonTitle: "Kayit Ol")
          ],
        ),
      ),
    );
  }

  void validateInputs() {
    if (_usernameText.text.isEmpty || _passwordText.text.isEmpty) {
      customDialog(
          context: context, title: "Hata", content: "Bos Alanlari Doldurunuz");
    } else {
      signInUser();
    }
  }

  signInUser() async {
    try {
      final authService = AuthService();
      final UserModel currentUser;
      final result = await authService.signInUser(
          email: _usernameText.text, password: _passwordText.text);
      if (result != null) {
        currentUser = UserModel(
            id: result.user!.uid,
            username: result.user!.email,
            fullname: result.user!.email,
            phone: "222-22-22");

        // ignore: use_build_context_synchronously
        context.read<CurrentUserProvider>().changeUser(currentUser);
        AppNavigator.replaceWith(Routes.main);
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }
}
