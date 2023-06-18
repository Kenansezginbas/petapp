import 'package:flutter/material.dart';
import 'package:pet_app/config/themes/light_theme.dart';
import 'package:pet_app/modules/auth/sign_in/sign_in_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const SignInView(),
    );
  }
}
