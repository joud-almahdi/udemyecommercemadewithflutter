import 'package:get/get.dart';
import 'package:udemyecommerce/Logic/Controllers/authcontroller.dart';

class Authbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
