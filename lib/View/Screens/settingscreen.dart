import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemyecommerce/Logic/Controllers/authcontroller.dart';
import 'package:udemyecommerce/Logic/Controllers/themecontroller.dart';

import '../../Utils/theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  ThemeController().changetheme();
                },
                child: Text(
                  "Dark mode",
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                )),
            SizedBox(
              height: 20,
            ),
            GetBuilder<AuthController>(
              builder: (controller) {
                return TextButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: "Logout From App",
                        titleStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        middleText: "Are you sure you need to logout?",
                        middleTextStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        backgroundColor: Colors.grey,
                        radius: 10,
                        textCancel: "No",
                        cancelTextColor: Colors.black,
                        textConfirm: "Yes",
                        confirmTextColor: Colors.black,
                        onCancel: () {
                          Get.back();
                        },
                        onConfirm: () {
                          controller.signoutfromapp();
                        },
                        buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                      );
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.black),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
