import 'package:get/get.dart';
import 'package:udemyecommerce/Logic/Controllers/Binding/authbinding.dart';
import 'package:udemyecommerce/Logic/Controllers/Binding/mainbinding.dart';
import 'package:udemyecommerce/Logic/Controllers/Binding/product_binding.dart';
import 'package:udemyecommerce/View/Screens/auth/forgot.dart';
import 'package:udemyecommerce/View/Screens/auth/login.dart';
import 'package:udemyecommerce/View/Screens/auth/signup.dart';
import 'package:udemyecommerce/View/Screens/cartscreen.dart';
import 'package:udemyecommerce/View/Screens/mainscreen.dart';

import '../View/Screens/welcome.dart';

class AppRoutes {
  // initialRoute:
  static const welcome = Routes.welocmescreen;
  static const mainscreen = Routes.mainscreen;

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
      name: Routes.cartscreen,
      page: (() => CartScreen()),
      bindings: [
        Authbinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
        name: Routes.mainscreen,
        page: (() => MainScreen()),
        bindings: [Authbinding(), Mainbinding(), ProductBinding()]),
  ];
}

class Routes {
  static const welocmescreen = '/welcome';
  static const LoginScreen = '/Login';
  static const SignupScreen = '/Signup';
  static const ForgotPassword = '/ForgotPassword';
  static const mainscreen = '/MainScreen';
  static const cartscreen = '/CartScreen';
}
