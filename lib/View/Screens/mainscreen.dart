import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemyecommerce/Logic/Controllers/cartcontroller.dart';
import 'package:udemyecommerce/Logic/Controllers/maincontroller.dart';
import 'package:udemyecommerce/Routes/routes.dart';
import 'package:udemyecommerce/Utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final controllerr = Get.find<MainController>();
  final cartcontrollerr = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            elevation: 0,
            title: Text('Asroo shop'),
            centerTitle: true,
            leading: Container(),
            actions: [
              Obx(() => Badge(
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    animationDuration: Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      cartcontrollerr.quantity().toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.cartscreen);
                        },
                        icon: Image.asset('assets/images/shop.png')),
                  ))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            currentIndex: controllerr.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(Icons.home,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(Icons.category,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(Icons.favorite,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(Icons.settings,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
                label: '',
              ),
            ],
            onTap: (index) {
              controllerr.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controllerr.currentIndex.value,
            children: controllerr.tabs,
          ),
        );
      }),
    );
  }
}
