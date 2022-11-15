import 'package:get/get.dart';
import 'package:udemyecommerce/Logic/Controllers/maincontroller.dart';

class Mainbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
