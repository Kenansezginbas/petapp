import 'package:flutter/material.dart';
import 'package:pet_app/config/colors/color_manager.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: ColorManager.orangeColor,

  //materials
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorManager.yellowColor,
    centerTitle: true,
  ),

  // buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorManager.darkBlueColor,
    ),
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(),
  ),
);
