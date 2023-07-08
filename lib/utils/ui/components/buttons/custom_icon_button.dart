import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icondata;
  const CustomIconButton(
      {super.key, required this.onPressed, required this.icondata});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icondata),
    );
  }
}
