import 'package:get/get.dart';
import 'package:udemyecommerce/Logic/Controllers/maincontroller.dart';
import 'package:udemyecommerce/Logic/Controllers/settingscontroller.dart';

class Mainbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
  }
}
