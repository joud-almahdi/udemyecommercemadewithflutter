import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemyecommerce/Utils/theme.dart';
import 'package:udemyecommerce/View/Widgets/home/carditems.dart';
import 'package:udemyecommerce/View/Widgets/home/searchform.dart';
import 'package:udemyecommerce/View/Widgets/text_util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? darkGreyClr : mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                      text: "Find Your ",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      underline: TextDecoration.none),
                  SizedBox(
                    height: 5,
                  ),
                  TextUtils(
                      text: "INSPIRATION ",
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      underline: TextDecoration.none),
                  SizedBox(
                    height: 20,
                  ),
                  SearchForm(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextUtils(
                  text: "Categories",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underline: TextDecoration.none),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CardItems(),
        ],
      ),
    ));
  }
}
