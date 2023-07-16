import 'package:flutter/material.dart';
import 'package:pet_app/config/router/fade_page_route.dart';
import 'package:pet_app/modules/auth/change_mail/update_email_view.dart';
import 'package:pet_app/modules/auth/change_password/update_password_view.dart';
import 'package:pet_app/modules/auth/sign_in/sign_in_view.dart';
import 'package:pet_app/modules/auth/sign_up/sign_up_view.dart';
import 'package:pet_app/modules/home/home_view.dart';
import 'package:pet_app/modules/main/main_view.dart';
import 'package:pet_app/modules/post/new_post.dart';
import 'package:pet_app/modules/splash/splash_view.dart';
import 'package:pet_app/modules/users/users_view.dart';

enum Routes {
  splash,
  main,
  signIn,
  signUp,
  home,
  profile,
  paywall,
  paymentDetail,
  paymentConfirmed,
  users,
  newPost,
  updatePassword,
  updateEmail
}

class _Paths {
  static const String splashPage = '/splash';
  static const String mainPage = '/main';
  static const String signInPage = '/signIn';
  static const String signUpPage = '/signUp';
  static const String home = '/splash/home';
  static const String users = '/users';
  static const String newPost = '/newPost';
  static const String updatePassword = '/updatePassword';
  static const String updateEmail = '/updateEmail';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splashPage,
    Routes.main: _Paths.mainPage,
    Routes.signIn: _Paths.signInPage,
    Routes.signUp: _Paths.signUpPage,
    Routes.home: _Paths.home,
    Routes.users: _Paths.users,
    Routes.newPost: _Paths.newPost,
    Routes.updateEmail: _Paths.updateEmail,
  };

  static String of(Routes route) => _pathMap[route] ?? splashPage;
}

//navigator
class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.mainPage:
        return FadeRoute(page: const MainView());
      case _Paths.signInPage:
        return FadeRoute(page: const SignInView());
      case _Paths.signUpPage:
        return FadeRoute(page: const SignUpView());
      case _Paths.home:
        return FadeRoute(page: const HomeView());
      case _Paths.users:
        return FadeRoute(page: const UsersView());
      case _Paths.newPost:
        return FadeRoute(page: const NewPost());
      case _Paths.updatePassword:
        return FadeRoute(page: const UpdatePasswordView());
      case _Paths.updateEmail:
        return FadeRoute(page: const UpdateMailView());
      default:
        return FadeRoute(page: const SplashView());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);
  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}
