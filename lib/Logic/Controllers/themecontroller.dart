import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../../Utils/theme.dart';

class ThemeController {
  final key = 'isDarkModes';
  final GetStorage boxstorage = GetStorage();

  void changetheme() {
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);

    saveThemeDataInBox(!getThemeDataFromBox());
  }

  ThemeMode get themeDataGet =>
      getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;

  saveThemeDataInBox(bool isdark) {
    boxstorage.write(key, isdark);
  }

  bool getThemeDataFromBox() {
    return boxstorage.read<bool>(key) ?? false;
  }
}
