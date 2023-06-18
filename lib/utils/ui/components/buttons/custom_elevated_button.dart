import 'package:flutter/material.dart';
import 'package:pet_app/config/colors/color_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonTitle;

  const CustomElevatedButton(
      {super.key, required this.onPressed, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonTitle,
        style: const TextStyle(color: ColorManager.whiteColor),
      ),
    );
  }
}
