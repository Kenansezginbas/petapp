import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonTitle;

  const CustomTextButton(
      {super.key, required this.onPressed, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(onPressed: onPressed, child: Text(buttonTitle));
    } else {
      return TextButton(
        onPressed: onPressed,
        child: Text(buttonTitle),
      );
    }
  }
}
