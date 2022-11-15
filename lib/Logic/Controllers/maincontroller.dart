import 'package:get/get.dart';
import 'package:udemyecommerce/View/Screens/categoryscreen.dart';
import 'package:udemyecommerce/View/Screens/favoritescreen.dart';
import 'package:udemyecommerce/View/Screens/homescreen.dart';
import 'package:udemyecommerce/View/Screens/settingscreen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ].obs;

  var title = [
    "Asroo Shop",
    "Categories",
    'Favourites',
    "Settings",
  ].obs;
}
