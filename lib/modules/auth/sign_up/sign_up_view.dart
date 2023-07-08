import 'package:flutter/material.dart';
import 'package:pet_app/config/router/routes_enum.dart';
import 'package:pet_app/modules/auth/components/logo_view.dart';
import 'package:pet_app/utils/ui/components/buttons/custom_elevated_button.dart';
import 'package:pet_app/utils/ui/components/buttons/custom_text_button.dart';
import 'package:pet_app/utils/ui/components/dialogs/custom_dialog.dart';
import 'package:pet_app/utils/ui/components/inputs/custom_text_field.dart';
import 'package:pet_app/utils/ui/functions/auth/auth_service.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _usernameText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();
  final TextEditingController _passwordConfirmText = TextEditingController();
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
            CustomTextField(
              hintText: "Sifre (Tekrar)",
              textEditingController: _passwordConfirmText,
            ),
            CustomElevatedButton(
                onPressed: validateInputs, buttonTitle: "Kayit Ol"),
            CustomTextButton(
                onPressed: () => AppNavigator.replaceWith(Routes.signIn),
                buttonTitle: "Giris Sayfasina Geri Don")
          ],
        ),
      ),
    );
  }

  void validateInputs() {
    if (_usernameText.text.isEmpty ||
        _passwordText.text.isEmpty ||
        _passwordConfirmText.text.isEmpty) {
      customDialog(
          context: context, title: "Hata", content: "Bos Alanlari Doldurunuz");
    } else {
      signUpUser();
    }
  }

  signUpUser() async {
    final authService = AuthService();
    final result = await authService.signUpUser(
        email: _usernameText.text, password: _passwordText.text);
    if (result != null) {
      resetControllers();
      AppNavigator.replaceWith(Routes.home);
    } else {}
  }

  resetControllers() {
    _usernameText.clear();
    _passwordText.clear();
    _passwordConfirmText.clear();
  }
}
