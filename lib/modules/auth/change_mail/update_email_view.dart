import 'package:flutter/material.dart';
import 'package:pet_app/config/router/routes_enum.dart';
import 'package:pet_app/utils/ui/components/buttons/custom_elevated_button.dart';
import 'package:pet_app/utils/ui/components/dialogs/custom_dialog.dart';
import 'package:pet_app/utils/ui/components/inputs/custom_text_field.dart';
import 'package:pet_app/utils/ui/functions/auth/auth_service.dart';

class UpdateMailView extends StatelessWidget {
  const UpdateMailView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController newMail = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomTextField(
            hintText: "Yeni Mail",
            textEditingController: newMail,
          ),
          CustomElevatedButton(
              onPressed: () async {
                final result = validateAndEmail(context, newMail.text);
              },
              buttonTitle: "Kaydet")
        ],
      ),
    );
  }

  Future<void> validateAndEmail(BuildContext context, String text) async {
    final AuthService authService = AuthService();
    final result = await authService.updateMail(text);
    if (result) {
      AppNavigator.replaceWith(Routes.splash);
    } else {
      customDialog(
          context: context, title: "Hata", content: "Mail Degistirilemedi");
    }
  }
}
