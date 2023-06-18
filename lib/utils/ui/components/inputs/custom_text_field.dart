import 'package:flutter/material.dart';
import 'package:pet_app/constants/sizes/padding_consts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;

  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.textEditingController,
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingConsts.p10),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
        ),
        keyboardType: textInputType,
      ),
    );
  }
}
