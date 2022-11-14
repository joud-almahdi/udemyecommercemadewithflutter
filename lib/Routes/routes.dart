import 'package:get/get.dart';
import 'package:udemyecommerce/Logic/Controllers/Binding/authbinding.dart';
import 'package:udemyecommerce/View/Screens/auth/forgot.dart';
import 'package:udemyecommerce/View/Screens/auth/login.dart';
import 'package:udemyecommerce/View/Screens/auth/signup.dart';
import 'package:udemyecommerce/View/Screens/mainscreen.dart';

import '../View/Screens/welcome.dart';

class AppRoutes {
  // initialRoute:
  static const welcome = Routes.welocmescreen;

  //     getPages:
  static final routes = [
    GetPage(name: Routes.welocmescreen, page: (() => const WelcomeScreen())),
    GetPage(
        name: Routes.LoginScreen,
        page: (() => Login()),
        binding: Authbinding()),
    GetPage(
        name: Routes.SignupScreen,
        page: (() => Signup()),
        binding: Authbinding()),
    GetPage(
        name: Routes.ForgotPassword,
        page: (() => ForgotPassword()),
        binding: Authbinding()),
    GetPage(
        name: Routes.mainscreen,
        page: (() => MainScreen()),
        binding: Authbinding()),
  ];
}

class Routes {
  static const welocmescreen = '/welcome';
  static const LoginScreen = '/Login';
  static const SignupScreen = '/Signup';
  static const ForgotPassword = '/ForgotPassword';
  static const mainscreen = '/MainScreen';
}
