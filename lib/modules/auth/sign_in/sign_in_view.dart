import 'package:flutter/material.dart';
import 'package:pet_app/modules/auth/sign_in/components/logo_view.dart';
import 'package:pet_app/utils/ui/components/buttons/custom_elevated_button.dart';
import 'package:pet_app/utils/ui/components/buttons/custom_text_button.dart';
import 'package:pet_app/utils/ui/components/inputs/custom_text_field.dart';

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
            CustomElevatedButton(onPressed: () {}, buttonTitle: "Giris Yap"),
            CustomTextButton(onPressed: () {}, buttonTitle: "Kayit Ol")
          ],
        ),
      ),
    );
  }
}
