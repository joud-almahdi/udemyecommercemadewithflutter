import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemyecommerce/Utils/theme.dart';
import 'package:udemyecommerce/View/Widgets/text_util.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
          minimumSize: const Size(360, 50)),
      child: TextUtils(
          text: text,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          underline: TextDecoration.none),
    );
  }
}
