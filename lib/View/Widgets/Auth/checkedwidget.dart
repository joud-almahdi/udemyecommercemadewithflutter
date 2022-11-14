import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:udemyecommerce/Logic/Controllers/authcontroller.dart';
import 'package:udemyecommerce/Utils/theme.dart';
import 'package:udemyecommerce/View/Widgets/text_util.dart';

class CheckedWidget extends StatelessWidget {
  CheckedWidget({super.key});

  final checkcontroller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: ((controller) {
      return Row(
        children: [
          InkWell(
            onTap: (() {
              controller.checked();
            }),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.ischecked
                  ? Get.isDarkMode
                      ? Image.asset('assets/images/check.png')
                      : Icon(
                          Icons.done,
                          color: pinkClr,
                          size: 30,
                        )
                  : Container(),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                  text: "I accept ",
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  underline: TextDecoration.none),
              TextUtils(
                  text: "Terms & Conditions ",
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  underline: TextDecoration.underline)
            ],
          ),
        ],
      );
    }));
  }
}
