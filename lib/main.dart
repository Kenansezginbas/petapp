import 'package:flutter/material.dart';
import 'package:pet_app/config/themes/light_theme.dart';
import 'package:pet_app/modules/auth/sign_in/sign_in_view.dart';
import 'package:pet_app/modules/main/main_view.dart';
import 'package:pet_app/provider/nav_bar_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => NavBarProvider(),
      ),
    ],
    child: const MyApp(),
  ));
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
        home: const SignInView());
  }
}


//provider listelerini disari aliyorsunuz. 
// sign in ve maindeki sayfalarin tasarimini duzenleyeceksiniz
//bottomnavbaritemlari disari cikacak
//inputlarin validateleri yapilacak
//eger keyboardtype email ise email validate yapilacak
//