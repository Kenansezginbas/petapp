import 'package:flutter/material.dart';
import 'package:pet_app/config/colors/color_manager.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: ColorManager.orangeColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorManager.darkBlueColor,
    ),
  ),
);
