import 'package:flutter/material.dart';
import 'package:pet_app/utils/ui/components/buttons/custom_elevated_button.dart';
import 'package:pet_app/utils/ui/components/dialogs/custom_dialog.dart';
import 'package:pet_app/utils/ui/components/inputs/custom_text_field.dart';
import 'package:pet_app/utils/ui/functions/auth/auth_service.dart';
import 'package:pet_app/utils/ui/functions/validate/validate_inputs.dart';

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController newPassword = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomTextField(
            hintText: "Yeni Sifre",
            textEditingController: newPassword,
          ),
          CustomElevatedButton(
              onPressed: () async {
                final result = validateAndUpdate(context, newPassword.text);
              },
              buttonTitle: "Kaydet")
        ],
      ),
    );
  }

  Future<void> validateAndUpdate(BuildContext context, String text) async {
    final AuthService authService = AuthService();
    final result = await authService.updatePassword(text);
    if (result) {
      customDialog(
          context: context,
          title: "Basarili",
          content: "Sifreniz Degistirildi");
    } else {
      customDialog(
          context: context, title: "Hata", content: "Sifre Degistirilemedi");
    }
  }
}
