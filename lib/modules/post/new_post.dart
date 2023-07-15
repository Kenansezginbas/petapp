import 'package:flutter/material.dart';
import 'package:pet_app/modules/post/post_model.dart';
import 'package:pet_app/utils/ui/components/buttons/custom_elevated_button.dart';
import 'package:pet_app/utils/ui/components/inputs/custom_text_field.dart';
import 'package:pet_app/utils/ui/functions/data/data_service.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../provider/auth/current_user_provider.dart';
import '../../utils/ui/components/dialogs/custom_dialog.dart';

class NewPost extends StatelessWidget {
  const NewPost({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController petName = TextEditingController();
    TextEditingController desc = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomTextField(hintText: "Pet Ismi", textEditingController: petName),
          CustomTextField(hintText: "Aciklama", textEditingController: desc),
          CustomElevatedButton(
            onPressed: () {
              savePost(context, petName.text, desc.text);
              petName.clear();
              desc.clear();
            },
            buttonTitle: "Kaydet",
          )
        ],
      ),
    );
  }

  savePost(BuildContext context, String petName, String desc) {
    final user = context.read<CurrentUserProvider>().user.username;
    final dataService = DataService();
    const uuid = Uuid();
    final validateControll = validateInputs(context, petName, desc);
    if (validateControll) {
      final post = PostModel(
          id: uuid.v4(), username: user, petName: petName, desc: desc);
      final result = dataService.addPost(post);
    } else {
      // customDialog(
      //     context: context, title: "Hata", content: "Bos Alanlari Doldurunuz");
    }
  }

  bool validateInputs(BuildContext context, String value1, String value2) {
    if (value1.isEmpty || value2.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
