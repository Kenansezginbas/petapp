import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/config/router/routes_enum.dart';
import 'package:pet_app/config/themes/light_theme.dart';
import 'package:pet_app/modules/auth/sign_in/sign_in_view.dart';
import 'package:pet_app/modules/main/main_view.dart';
import 'package:pet_app/modules/splash/splash_view.dart';
import 'package:pet_app/provider/auth/current_user_provider.dart';
import 'package:pet_app/provider/layouts/nav_bar_provider.dart';
import 'package:pet_app/provider/page_view_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavBarProvider()),
        ChangeNotifierProvider(create: (_) => PageViewProvider()),
        ChangeNotifierProvider(create: (_) => CurrentUserProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      home: const SplashView(),
    );
  }
}


//provider listelerini disari aliyorsunuz. 
// sign in ve maindeki sayfalarin tasarimini duzenleyeceksiniz
//bottomnavbaritemlari disari cikacak
//inputlarin validateleri yapilacak
//eger keyboardtype email ise email validate yapilacak
//