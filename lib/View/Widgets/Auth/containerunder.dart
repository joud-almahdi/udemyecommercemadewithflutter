import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemyecommerce/Utils/theme.dart';
import 'package:udemyecommerce/View/Widgets/text_util.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String texttype;
  final Function() onPressed;
  const ContainerUnder(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.texttype});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? pinkClr : mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: [
          TextUtils(
              text: text,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              underline: TextDecoration.none),
          TextButton(
              onPressed: onPressed,
              child: TextUtils(
                  text: texttype,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  underline: TextDecoration.none)),
        ],
      ),
    );
  }
}
