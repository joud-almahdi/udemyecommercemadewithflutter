import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:udemyecommerce/Routes/routes.dart';
import 'package:udemyecommerce/View/Widgets/text_util.dart';
import 'package:udemyecommerce/Utils/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  height: 70,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: TextUtils(
                      text: 'Welcome',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      underline: TextDecoration.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 70,
                  width: 2300,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        text: 'Asroo',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                        underline: TextDecoration.none,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      TextUtils(
                        text: 'Shop',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        underline: TextDecoration.none,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    onPressed: (() {
                      Get.offNamed(Routes.LoginScreen);
                    }),
                    child: TextUtils(
                      text: 'Get Started',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      underline: TextDecoration.none,
                    )),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                      text: "Dont't have an account? ",
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      underline: TextDecoration.none,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.SignupScreen);
                        },
                        child: TextUtils(
                          text: 'Sign Up',
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          underline: TextDecoration.underline,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
